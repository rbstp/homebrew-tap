cask "colliebar" do
  version "0.2.12"
  sha256 "516b05a41c939f9b23dec2a2de14acc19ba626d97e57eb09d147c1b4ed9776fd"

  url "https://github.com/rbstp/collie/releases/download/v0.2.12/CollieBar-0.2.12-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
