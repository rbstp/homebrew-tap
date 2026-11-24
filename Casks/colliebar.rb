cask "colliebar" do
  version "0.2.7"
  sha256 "1ad821bee402807531a1ad47153848524e0e1ab3572a4ef77f278402de7521ce"

  url "https://github.com/rbstp/collie/releases/download/v0.2.7/CollieBar-0.2.7-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
