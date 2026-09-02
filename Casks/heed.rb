cask "heed" do
  # Both lines are rewritten by heed's release workflow (.github/workflows/release.yml in
  # rbstp/heed) on every release. Editing them by hand only invites the two disagreeing.
  version "0.6.2"
  sha256 "251b2f585f04c90863f175cced778c4d34b29a1fd17b8aa062862141df0c059a"

  url "https://github.com/rbstp/heed/releases/download/v#{version}/Heed-#{version}.zip",
      verified: "github.com/rbstp/heed/"
  name "Heed"
  desc "Focus-follows-mouse background agent"
  homepage "https://github.com/rbstp/heed"

  # Releases are built arm64-only; there is no Intel slice. Without this line an Intel Mac would
  # install cleanly and launchd would then respawn, forever, a binary it can never exec.
  depends_on arch: :arm64
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

    # Clear the Accessibility grant, which is already dead at this point: ad-hoc signing makes every
    # release a new identity to TCC, so the record written for the previous version no longer
    # matches this binary. Leaving it in place is worse than having none, because macOS suppresses
    # the permission prompt while any record for the bundle ID exists -- the agent then waits
    # forever while the checkbox in System Settings still looks ticked.
    #
    # This has to run before the bootstrap below. The agent prompts once, at startup, and polls
    # silently after that; reset it afterwards and nothing asks until the next login.
    #
    # Tolerate failure: on a first install there is no record to clear, and a machine that has never
    # granted the permission should not have `brew install` fail over it.
    system_command "/usr/bin/tccutil",
                   args:         ["reset", "Accessibility", label],
                   must_succeed: false

    domain = "gui/#{Process.uid}"
    system_command "/bin/launchctl", args: ["bootout", "#{domain}/#{label}"], must_succeed: false
    system_command "/bin/launchctl", args: ["bootstrap", domain, agent]
  end

  # Boots the agent out and removes the plist. Runs on upgrade too, before postflight bootstraps the
  # new one, so there is no window with two copies loaded.
  uninstall launchctl: "io.github.rbstp.heed"

  zap trash: [
    "~/Library/Logs/heed.log",
    "~/Library/Preferences/io.github.rbstp.heed.plist",
  ]

  caveats <<~EOS
    Grant Accessibility to Heed under System Settings > Privacy & Security >
    Accessibility. The agent notices within a couple of seconds; nothing to restart.

    Expect to grant it again after every upgrade. Released builds are ad-hoc signed, so
    each version is a new identity as far as TCC is concerned and the old grant cannot
    carry over. Installing clears the stale entry, which is what lets Heed ask you for
    the permission again instead of going quiet behind a checkbox that still looks
    ticked.

    Uninstalling leaves the entry listed. To clear it:

      tccutil reset Accessibility io.github.rbstp.heed
  EOS
end
