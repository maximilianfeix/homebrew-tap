class Spillage < Formula
  desc "Find the API keys your coding agents spilled into their logs"
  homepage "https://maximilianfeix.github.io/spillage/"
  url "https://github.com/maximilianfeix/spillage/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "f6b79afa353cf1558d4023be9dadf5745fab9a5e92a05088c11a9ad746b0a4d1"
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
