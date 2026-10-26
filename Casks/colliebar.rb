cask "colliebar" do
  version "0.1.11"
  sha256 "c1e07746bec317e6911ae4be00203f4daaea578759d76752b3956a13b70b9325"

  url "https://github.com/rbstp/collie/releases/download/v0.1.11/CollieBar-0.1.11-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
