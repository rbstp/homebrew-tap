cask "colliebar" do
  version "0.1.17"
  sha256 "ce3ff5833bc856b3bf27106d93f7716363a10cd65eb31a2da0d95c56a5843629"

  url "https://github.com/rbstp/collie/releases/download/v0.1.17/CollieBar-0.1.17-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
