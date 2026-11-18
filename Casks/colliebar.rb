cask "colliebar" do
  version "0.2.1"
  sha256 "dbb2d6a7fcd9c88dc43a3d12edc8d933b731bad5a27274651a181dd972a414aa"

  url "https://github.com/rbstp/collie/releases/download/v0.2.1/CollieBar-0.2.1-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
