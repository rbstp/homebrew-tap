cask "colliebar" do
  version "0.1.22"
  sha256 "310ed6e258c3106eebf5582bcf56984fe66784aa1277b15c6c426d0396162d68"

  url "https://github.com/rbstp/collie/releases/download/v0.1.22/CollieBar-0.1.22-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
