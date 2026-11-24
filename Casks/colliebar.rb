cask "colliebar" do
  version "0.2.10"
  sha256 "5c202d6ededc611e304d4be91d2ac4b83e792f27d9225f1f4f5a9f52fdd8a2bf"

  url "https://github.com/rbstp/collie/releases/download/v0.2.10/CollieBar-0.2.10-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
