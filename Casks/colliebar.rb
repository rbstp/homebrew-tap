cask "colliebar" do
  version "0.1.14"
  sha256 "4fdddcf176ef477f66136f4a4a1bdc07acc5556ac138b00e8b40e4feeb47294a"

  url "https://github.com/rbstp/collie/releases/download/v0.1.14/CollieBar-0.1.14-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
