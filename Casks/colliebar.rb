cask "colliebar" do
  version "0.2.9"
  sha256 "ba82aae834fe1f71db7d133ecb4c285a1985c0cb1692df5a986339e906cacc50"

  url "https://github.com/rbstp/collie/releases/download/v0.2.9/CollieBar-0.2.9-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
