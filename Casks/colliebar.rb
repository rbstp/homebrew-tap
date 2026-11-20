cask "colliebar" do
  version "0.2.4"
  sha256 "70214c8e1cf2add19ce03f3ba6943cd2e27dfc9fa9bd9683635589657ecd324a"

  url "https://github.com/rbstp/collie/releases/download/v0.2.4/CollieBar-0.2.4-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
