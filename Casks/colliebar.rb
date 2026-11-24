cask "colliebar" do
  version "0.2.8"
  sha256 "2e53d943d2cc49718ba952231126419e4c862bc345be4812c61da2b73db446bc"

  url "https://github.com/rbstp/collie/releases/download/v0.2.8/CollieBar-0.2.8-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
