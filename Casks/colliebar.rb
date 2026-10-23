cask "colliebar" do
  version "0.1.8"
  sha256 "6091ebef532eadb87b2d5f7fa38d6a63c1c2586ed3b699764e6595600208c575"

  url "https://github.com/rbstp/collie/releases/download/v0.1.8/CollieBar-0.1.8-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
