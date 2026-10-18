cask "colliebar" do
  version "0.1.4"
  sha256 "65293c0b82fc603a8f647d8c2514ead3f58d795ec69fc5cb3c229c5927bf6e26"

  url "https://github.com/rbstp/collie/releases/download/v0.1.4/CollieBar-0.1.4-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
