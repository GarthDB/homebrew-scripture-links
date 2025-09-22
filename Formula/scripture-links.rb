class ScriptureLinks < Formula
  desc "Convert scripture references to URLs for ChurchofJesusChrist.org"
  homepage "https://github.com/GarthDB/scripture-links"
  version "1.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GarthDB/scripture-links/releases/download/v1.2.1/scripture-links-aarch64-apple-darwin.tar.gz"
      sha256 "5af0bbb519eb395cf394c4cee9fd6f435021095f05de76d4dcaeaf7f85810c33"
    else
      url "https://github.com/GarthDB/scripture-links/releases/download/v1.2.1/scripture-links-x86_64-apple-darwin.tar.gz"
      sha256 "884820affd4b104816136f4bd930bf8cb5540578fcefc8140f4938f82dcb8b4b"
    end
  end

  on_linux do
    url "https://github.com/GarthDB/scripture-links/releases/download/v1.2.1/scripture-links-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "007617a800a8372c20a7a7af2363eb9e7a2e09b741cb2d89b3bdecfbbd0d203d"
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
