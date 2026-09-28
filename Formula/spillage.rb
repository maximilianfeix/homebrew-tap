class Spillage < Formula
  desc "Find the API keys your coding agents spilled into their logs"
  homepage "https://maximilianfeix.github.io/spillage/"
  url "https://github.com/maximilianfeix/spillage/archive/refs/tags/v0.6.7.tar.gz"
  sha256 "2fdb12427e8da9416fdab05309c2e7ca44c742a54696707bbfd3672af04af8d3"
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
