cask "colliebar" do
  version "0.1.9"
  sha256 "a812c7b5bfc6caf188546e383580d3757eea787f33335beb7517e2225c4b877b"

  url "https://github.com/rbstp/collie/releases/download/v0.1.9/CollieBar-0.1.9-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
