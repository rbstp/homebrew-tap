cask "colliebar" do
  version "0.2.0"
  sha256 "61609e957bf5c66a700eabff24c3b92d0df543dc7b7f459b256fa2998e1b088c"

  url "https://github.com/rbstp/collie/releases/download/v0.2.0/CollieBar-0.2.0-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
