cask "colliebar" do
  version "0.1.21"
  sha256 "659c37a141c217f48cd395f84eb52fb80662a94b33e5b0aa035f2db4717886e3"

  url "https://github.com/rbstp/collie/releases/download/v0.1.21/CollieBar-0.1.21-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
