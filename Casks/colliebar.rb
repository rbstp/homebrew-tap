cask "colliebar" do
  version "0.2.15"
  sha256 "cea252863efb6427c9e4060f28c85658a483819b11805559622a602636283e5a"

  url "https://github.com/rbstp/collie/releases/download/v0.2.15/CollieBar-0.2.15-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
