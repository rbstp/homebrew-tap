cask "colliebar" do
  version "0.1.7"
  sha256 "e9c9286283efdf939a719b120646d3b278154c1c1c02fb13f5f8125ce5e8c3df"

  url "https://github.com/rbstp/collie/releases/download/v0.1.7/CollieBar-0.1.7-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
