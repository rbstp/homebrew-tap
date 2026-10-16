cask "heed" do
  # Both lines are rewritten by heed's release workflow (.github/workflows/release.yml in
  # rbstp/heed) on every release. Editing them by hand only invites the two disagreeing.
  version "0.13.0"
  sha256 "7804e7a77c1134799e217a8eafb553a2403997896457d48ce80ee209742f0245"

  url "https://github.com/rbstp/heed/releases/download/v#{version}/Heed-#{version}.zip",
      verified: "github.com/rbstp/heed/"
  name "Heed"
  desc "Focus-follows-mouse background agent"
  homepage "https://github.com/rbstp/heed"

  # Releases are built arm64-only; there is no Intel slice. Without this line an Intel Mac would
  # install cleanly and then fail to open it.
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Heed.app"

  uninstall quit: "io.github.rbstp.heed"

  zap trash: [
    "~/Library/Application Support/Heed",
    "~/Library/Logs/heed.log",
    "~/Library/Preferences/io.github.rbstp.heed.plist",
  ]

  caveats <<~EOS
    Open Heed once to start it. It asks for Accessibility under System Settings >
    Privacy & Security > Accessibility, and adds itself to your login items; Open
    at Login in its menu turns that off.

    Uninstalling leaves the Accessibility entry listed. To clear it:

      tccutil reset Accessibility io.github.rbstp.heed
  EOS
end
