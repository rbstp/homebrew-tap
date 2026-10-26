class Collied < Formula
  desc "Control local coding agents from an iPhone"
  homepage "https://collie.rbstp.dev"
  url "https://github.com/rbstp/collie/releases/download/v0.1.12/collied-0.1.12-macos-arm64.tar.gz"
  version "0.1.12"
  sha256 "38dc2e86941d5b13ede4ab5bf3e4eb135cd6a185e57da28809abeca667eaf993"
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
    doc.install "release.json", "README.md", "THIRD_PARTY_NOTICES"
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
