cask "heed" do
  # Both lines are rewritten by heed's release workflow (.github/workflows/release.yml in
  # rbstp/heed) on every release. Editing them by hand only invites the two disagreeing.
  version "0.12.2"
  sha256 "f6b8817865be88c36b2d98bf4aa991fa3e1bc551fa72064e229a151a7f4c1631"

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

  # The launch agent is written rather than shipped ready-made: launchd does not expand ~, so the
  # plist has to name the absolute path the app actually landed on. The template comes out of the
  # bundle so that this and `make install-agent` cannot drift apart. Scripting like this is why the
  # cask lives in its own tap rather than in homebrew-cask.
  postflight do
    app_path = "#{appdir}/Heed.app"
    label = "io.github.rbstp.heed"
    agent = "#{Dir.home}/Library/LaunchAgents/#{label}.plist"

    plist = File.read("#{app_path}/Contents/Resources/agent.plist.in")
                .gsub("@BUNDLE_ID@", label)
                .gsub("@EXECUTABLE@", "#{app_path}/Contents/MacOS/Heed")
                .gsub("@LOG@", "#{Dir.home}/Library/Logs/heed.log")
    FileUtils.mkdir_p File.dirname(agent)
    File.write agent, plist

    # Releases up to 0.11.2 were ad-hoc signed, which made every version a new identity to TCC: the
    # Accessibility record written for one no longer matched the next. Coming from one of those, the
    # stale record has to go, because macOS suppresses the permission prompt while any record for
    # the bundle ID exists -- the agent would then wait forever while the checkbox in System
    # Settings still looked ticked.
    #
    # A Developer ID signature is a stable identity, so this is needed once per machine and never
    # again. The stamp is what marks it done; without one this cannot tell an upgrade from an
    # ad-hoc build apart from a first install, where the reset is a harmless no-op anyway.
    #
    # It has to run before the bootstrap below. The agent asks for the permission once, at startup,
    # and polls silently after that; reset it afterwards and nothing asks until the next login.
    stamp = "#{Dir.home}/Library/Application Support/Heed/developer-id-reset"
    unless File.exist? stamp
      # Tolerate failure: a machine that has never granted the permission has no record to clear,
      # and should not have `brew install` fail over it.
      system_command "/usr/bin/tccutil",
                     args:         ["reset", "Accessibility", label],
                     must_succeed: false
      FileUtils.mkdir_p File.dirname(stamp)
      FileUtils.touch stamp
    end

    domain = "gui/#{Process.uid}"
    system_command "/bin/launchctl", args: ["bootout", "#{domain}/#{label}"], must_succeed: false
    system_command "/bin/launchctl", args: ["bootstrap", domain, agent]
  end

  # Boots the agent out and removes the plist. Runs on upgrade too, before postflight bootstraps the
  # new one, so there is no window with two copies loaded.
  uninstall launchctl: "io.github.rbstp.heed"

  zap trash: [
    "~/Library/Application Support/Heed",
    "~/Library/Logs/heed.log",
    "~/Library/Preferences/io.github.rbstp.heed.plist",
  ]

  caveats <<~EOS
    Grant Accessibility to Heed under System Settings > Privacy & Security >
    Accessibility. The agent notices within a couple of seconds; nothing to restart.

    The grant carries across upgrades. Coming from 0.11.2 or earlier it cannot: those
    builds were ad-hoc signed, so each one was a different app as far as TCC was
    concerned. Installing clears that stale entry once, which is what lets Heed ask you
    for the permission again instead of going quiet behind a checkbox that still looks
    ticked.

    Uninstalling leaves the entry listed. To clear it:

      tccutil reset Accessibility io.github.rbstp.heed
  EOS
end
