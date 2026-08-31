cask "heed" do
  # Both lines are rewritten by .github/workflows/release.yml when a v* tag is pushed. Editing them
  # by hand only invites the two disagreeing.
  version "0.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/rbstp/heed/releases/download/v#{version}/Heed-#{version}.zip",
      verified: "github.com/rbstp/heed/"
  name "Heed"
  desc "Focus-follows-mouse background agent"
  homepage "https://github.com/rbstp/heed"

  depends_on macos: :sonoma

  app "Heed.app"

  # Two things happen here that a cask normally would not do.
  #
  # The quarantine attribute is stripped because released builds are ad-hoc signed -- there is no
  # Developer ID, so there is nothing to notarize with, and Gatekeeper refuses a quarantined copy
  # outright. That alone is why this cask lives in its own tap rather than in homebrew-cask.
  #
  # And the launch agent is written rather than shipped ready-made: launchd does not expand ~, so the
  # plist has to name the absolute path the app actually landed on. The template comes out of the
  # bundle so that this and `make install-agent` cannot drift apart.
  postflight do
    app_path = "#{appdir}/Heed.app"
    label = "io.github.rbstp.heed"
    agent = "#{Dir.home}/Library/LaunchAgents/#{label}.plist"

    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", app_path]

    plist = File.read("#{app_path}/Contents/Resources/agent.plist.in")
                .gsub("@BUNDLE_ID@", label)
                .gsub("@EXECUTABLE@", "#{app_path}/Contents/MacOS/Heed")
                .gsub("@LOG@", "#{Dir.home}/Library/Logs/heed.log")
    FileUtils.mkdir_p File.dirname(agent)
    File.write agent, plist

    domain = "gui/#{Process.uid}"
    system_command "/bin/launchctl", args: ["bootout", "#{domain}/#{label}"], must_succeed: false
    system_command "/bin/launchctl", args: ["bootstrap", domain, agent]
  end

  # Boots the agent out and removes the plist. Runs on upgrade too, before postflight bootstraps the
  # new one, so there is no window with two copies loaded.
  uninstall launchctl: "io.github.rbstp.heed"

  zap trash: "~/Library/Logs/heed.log"

  caveats <<~EOS
    Grant Accessibility to Heed under System Settings > Privacy & Security >
    Accessibility. The agent notices within a couple of seconds; nothing to restart.

    Released builds are ad-hoc signed, so each version is a new identity as far as TCC
    is concerned and the grant does not survive an upgrade -- while the checkbox still
    looks ticked. After `brew upgrade`, if Heed goes quiet:

      tccutil reset Accessibility io.github.rbstp.heed

    Uninstalling leaves that entry listed; the same line clears it.
  EOS
end
