cask "colliebar" do
  version "0.1.0"
  sha256 "447ce956ade0ddc9be811a5301bbb193daee4d2cac7fa1f335ca9e072124e61b"

  url "https://github.com/rbstp/collie/releases/download/v0.1.0/CollieBar-0.1.0-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
