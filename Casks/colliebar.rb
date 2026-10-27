cask "colliebar" do
  version "0.1.13"
  sha256 "235553cd7b2267e4aa9979fc4466aed85694287cae0a1585bf72cc09aa420e97"

  url "https://github.com/rbstp/collie/releases/download/v0.1.13/CollieBar-0.1.13-macos-arm64.zip"
  name "CollieBar"
  desc "Menu bar companion for collied"
  homepage "https://collie.rbstp.dev/"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "CollieBar.app"

  uninstall quit: "dev.rbstp.colliebar"
end
