class ScriptureLinks < Formula
  desc "Convert scripture references to URLs for ChurchofJesusChrist.org"
  homepage "https://github.com/GarthDB/scripture-links"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GarthDB/scripture-links/releases/download/v1.1.0/scripture-links-aarch64-apple-darwin.tar.gz"
      sha256 "f816127972d77b992d0e4948f90bd4f27c99f8dd27572b78fa77ec6fbf781cce"
    else
      url "https://github.com/GarthDB/scripture-links/releases/download/v1.1.0/scripture-links-x86_64-apple-darwin.tar.gz"
      sha256 "42f07a2a5b3131638f9ba78918bb3c93697ea1538160630c021f325acce5cce1"
    end
  end

  on_linux do
    url "https://github.com/GarthDB/scripture-links/releases/download/v1.1.0/scripture-links-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "77a3a1e3ad66f03117162e60efce5c1a304f3aa8b7aeda09993430585eb23bbc"
  end

  def install
    bin.install "scripture-links"
  end

  test do
    # Test basic functionality
    output = shell_output("#{bin}/scripture-links --reference 'Genesis 1:1'")
    assert_match "https://www.churchofjesuschrist.org/study/scriptures/ot/gen/1", output
    
    # Test help command
    help_output = shell_output("#{bin}/scripture-links --help")
    assert_match "Generate links to scriptures on ChurchofJesusChrist.org", help_output
  end
end
