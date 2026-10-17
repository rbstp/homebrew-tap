cask "colliebar" do
  version "0.1.2"
  sha256 "0f6e722c7f5c50930ba10977ef6bcb79e56b02cb9aaf7c93f6a1844cf9557477"

  url "https://github.com/rbstp/collie/releases/download/v0.1.2/CollieBar-0.1.2-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
