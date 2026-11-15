cask "colliebar" do
  version "0.1.19"
  sha256 "9ddb63aaaa2b6efd37e4251443af9b747b255c13b0f77bb3b0662806326088f5"

  url "https://github.com/rbstp/collie/releases/download/v0.1.19/CollieBar-0.1.19-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
