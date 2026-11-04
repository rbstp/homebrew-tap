cask "colliebar" do
  version "0.1.15"
  sha256 "578f8f5acbe97338c1eccf43028b38e9abfa26891cf555be22503827a974756b"

  url "https://github.com/rbstp/collie/releases/download/v0.1.15/CollieBar-0.1.15-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
