cask "colliebar" do
  version "0.2.11"
  sha256 "e8e9790c9a6b83b2efbd540780390253588561f84790d545a13f8a1aa12f47ec"

  url "https://github.com/rbstp/collie/releases/download/v0.2.11/CollieBar-0.2.11-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
