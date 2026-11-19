cask "colliebar" do
  version "0.2.3"
  sha256 "ee3375cc60dae469c4b48f3d406309fbc881acfefa4b97e6ee4fbaa0a45f99f6"

  url "https://github.com/rbstp/collie/releases/download/v0.2.3/CollieBar-0.2.3-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
