cask "colliebar" do
  version "0.0.152"
  sha256 "fd001cbd666b20adf7a4a2a077e32a68c21c7b5019ca0741ae0812b672456cdb"

  url "https://github.com/rbstp/collie/releases/download/v0.0.152/CollieBar-0.0.152-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
