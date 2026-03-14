class ScriptureLinks < Formula
  desc "Convert scripture references to URLs for ChurchofJesusChrist.org"
  homepage "https://github.com/GarthDB/scripture-links"
  version "1.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GarthDB/scripture-links/releases/download/v1.2.1/scripture-links-aarch64-apple-darwin.tar.gz"
      sha256 "46e3fa1cececcc5bc76827fe3bd2452e7764b89d5ef88e5254d707703a023933"
    else
      url "https://github.com/GarthDB/scripture-links/releases/download/v1.2.1/scripture-links-x86_64-apple-darwin.tar.gz"
      sha256 "a9b72be90ffe5aee3ccea579871f77a4aa6dc64fb1416fc2ab56054918547591"
    end
  end

  on_linux do
    url "https://github.com/GarthDB/scripture-links/releases/download/v1.2.1/scripture-links-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3f2bca053407457b2af12079502a5a42da0b8898b20082a738eefda193ffbe5a"
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
