cask "colliebar" do
  version "0.1.6"
  sha256 "a184ed206750b69f7ac88ba97db886750ced2fcd39a6eb7e815e4f7aba5c6101"

  url "https://github.com/rbstp/collie/releases/download/v0.1.6/CollieBar-0.1.6-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
