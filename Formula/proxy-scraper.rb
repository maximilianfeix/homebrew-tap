class ProxyScraper < Formula
  include Language::Python::Virtualenv

  desc "Free proxies that actually work: 700+ sources, every hit verified"
  homepage "https://github.com/maximilianfeix/proxy-scraper"
  url "https://files.pythonhosted.org/packages/64/08/cb1fe53e27ca0463231dedb9d6b15665563df0a63bd3d127b05b90ae53e4/proxy_scraper_cli-1.31.0.tar.gz"
  sha256 "5e5abf7d3c8826508b1d504a97526805771306ddafad1914150ef1db1d9de184"
  license "MIT"

  depends_on "python@3.14"

  resource "certifi" do
    url "https://files.pythonhosted.org/packages/fd/11/b524cbd9bbdaca58608e4cf4053fd463417549e1959fa8d3aa18319f9555/certifi-2026.10.23.tar.gz"
    sha256 "a9895e6e2758b371e0545e321a3a8fd1fcfd9829ada8824a936dfb16aaaf36cd"
  end

  resource "markdown-it-py" do
    url "https://files.pythonhosted.org/packages/06/ff/7841249c247aa650a76b9ee4bbaeae59370dc8bfd2f6c01f3630c35eb134/markdown_it_py-4.2.0.tar.gz"
    sha256 "04a21681d6fbb623de53f6f364d352309d4094dd4194040a10fd51833e418d49"
  end

  resource "mdurl" do
    url "https://files.pythonhosted.org/packages/d6/54/cfe61301667036ec958cb99bd3efefba235e65cdeb9c84d24a8293ba1d90/mdurl-0.1.2.tar.gz"
    sha256 "bb413d29f5eea38f31dd4754dd7377d4465116fb207585f97bf925588687c1ba"
  end

  resource "pygments" do
    url "https://files.pythonhosted.org/packages/49/2e/ced460408999b33da6b31b0021b0f37d329e202d4169aeb164493778f25b/pygments-2.21.0.tar.gz"
    sha256 "610ca751c9bc2492b38eb9a38a7fbc93edbbb2d7182edaf34e66ae493dee5c8c"
  end

  resource "rich" do
    url "https://files.pythonhosted.org/packages/c0/8f/0722ca900cc807c13a6a0c696dacf35430f72e0ec571c4275d2371fca3e9/rich-15.0.0.tar.gz"
    sha256 "edd07a4824c6b40189fb7ac9bc4c52536e9780fbbfbddf6f1e2502c31b068c36"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/proxy-scraper --version")
    assert_match "proxy-scraper", shell_output("#{bin}/proxy-scraper --completion zsh")
  end
end
