class Collied < Formula
  desc "Control local coding agents from an iPhone"
  homepage "https://collie.rbstp.dev"
  url "https://github.com/rbstp/collie/releases/download/v0.1.5/collied-0.1.5-macos-arm64.tar.gz"
  version "0.1.5"
  sha256 "9145950e791ca8269c28ed1420c3a8f60153fcf74081bfaa374d9c4c595a0277"
  license "Apache-2.0"

  depends_on arch: :arm64
  depends_on macos: :tahoe

  def install
    bin.install "collied"
    (share/"collied").install "install.sh"
    (bin/"collied-install").write <<~SH
      #!/bin/bash
      exec /bin/bash "#{share}/collied/install.sh" "$@"
    SH
    chmod 0755, bin/"collied-install"
    doc.install "release.json", "README.md"
  end

  def caveats
    <<~EOS
      To install or refresh the daemon service executable explicitly, run:
        collied-install --replace
      This preserves user data and the existing service running state.
      After first install, add ~/.cargo/bin to PATH and run collied setup.
      Do not use brew services. Uninstall the service before brew uninstall:
        ~/.cargo/bin/collied service uninstall
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/collied --version")
  end
end
