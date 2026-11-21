cask "colliebar" do
  version "0.2.6"
  sha256 "7fd416874978e5a42aba64260ab568e1adf4fa040ca8926d5399346022bc8baf"

  url "https://github.com/rbstp/collie/releases/download/v0.2.6/CollieBar-0.2.6-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
