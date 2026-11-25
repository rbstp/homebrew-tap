cask "colliebar" do
  version "0.2.16"
  sha256 "42e3f9ba0a7ae64742a8af6a08401b59826d776a7af796eced2dd8699066a628"

  url "https://github.com/rbstp/collie/releases/download/v0.2.16/CollieBar-0.2.16-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
