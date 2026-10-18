cask "colliebar" do
  version "0.1.5"
  sha256 "0fa5833198dc7367cdc584c3d6128b408751a9e2d728dcb6daf0e24e8ba09916"

  url "https://github.com/rbstp/collie/releases/download/v0.1.5/CollieBar-0.1.5-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
