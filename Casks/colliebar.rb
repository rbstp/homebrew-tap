cask "colliebar" do
  version "0.1.10"
  sha256 "24351c61a37df71f76a4259ed48800aa3b5402e2d72ee74ff140efca8a00d8fd"

  url "https://github.com/rbstp/collie/releases/download/v0.1.10/CollieBar-0.1.10-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
