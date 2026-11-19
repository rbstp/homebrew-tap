cask "colliebar" do
  version "0.2.2"
  sha256 "eae65882ed806e89433ea2eda8041ad8ebcc2142114a6fd47e3986eec821d964"

  url "https://github.com/rbstp/collie/releases/download/v0.2.2/CollieBar-0.2.2-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
