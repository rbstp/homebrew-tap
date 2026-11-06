cask "colliebar" do
  version "0.1.16"
  sha256 "e80089d21c255285ea653f88840c9a71172865d46239175cc6c39cd1ccf75e94"

  url "https://github.com/rbstp/collie/releases/download/v0.1.16/CollieBar-0.1.16-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
