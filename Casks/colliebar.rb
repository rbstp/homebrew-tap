cask "colliebar" do
  version "0.2.13"
  sha256 "d131bd925400de0b14ab8f9db5764863639c299505cc47cf8d93e81d56742d6a"

  url "https://github.com/rbstp/collie/releases/download/v0.2.13/CollieBar-0.2.13-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
