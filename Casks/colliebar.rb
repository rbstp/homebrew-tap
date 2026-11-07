cask "colliebar" do
  version "0.1.18"
  sha256 "e8b8b5175a45961fe520fd7bcbad2eaffa30e0b2d7594473a90be9b1c1c3a07e"

  url "https://github.com/rbstp/collie/releases/download/v0.1.18/CollieBar-0.1.18-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
