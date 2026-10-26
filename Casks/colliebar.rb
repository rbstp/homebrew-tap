cask "colliebar" do
  version "0.1.12"
  sha256 "129913d5cc88b10f6ecc4827078ca4c28e1b83b2ab17c8916433a933f8f11520"

  url "https://github.com/rbstp/collie/releases/download/v0.1.12/CollieBar-0.1.12-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
