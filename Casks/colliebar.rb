cask "colliebar" do
  version "0.1.20"
  sha256 "b08aa8d497df0bbcedb73a232e90828dd609781761996ff1ad2d20df7d0be4bd"

  url "https://github.com/rbstp/collie/releases/download/v0.1.20/CollieBar-0.1.20-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
