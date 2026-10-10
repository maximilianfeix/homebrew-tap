class Spillage < Formula
  desc "Keep API keys out of your coding agents: block, find and scrub leaks"
  homepage "https://maximilianfeix.github.io/spillage/"
  url "https://github.com/maximilianfeix/spillage/archive/refs/tags/v0.9.2.tar.gz"
  sha256 "3273de6a4d54b48ae529883a1a4b078c19bdad05657b55890475b3636b1d96fe"
  license "MIT"

  depends_on "python@3.14"

  # spillage has no dependencies, so the package folder is all there is to install
  def install
    libexec.install "spillage"
    (bin/"spillage").write <<~SH
      #!/bin/bash
      PYTHONPATH="#{libexec}" exec "#{Formula["python@3.14"].opt_bin}/python3.14" -m spillage "$@"
    SH
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/spillage --version")
    assert_match "no secrets", pipe_output("#{bin}/spillage check", "nothing to see here")
  end
end
