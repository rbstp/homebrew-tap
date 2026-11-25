cask "colliebar" do
  version "0.2.14"
  sha256 "7ae1bd976a569b9c8d19af414cea984749466886b17abc7c1c8d425579bb4f5c"

  url "https://github.com/rbstp/collie/releases/download/v0.2.14/CollieBar-0.2.14-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
