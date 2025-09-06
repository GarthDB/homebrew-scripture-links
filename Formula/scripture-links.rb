class ScriptureLinks < Formula
  desc "Convert scripture references to URLs for ChurchofJesusChrist.org"
  homepage "https://github.com/GarthDB/scripture-links"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GarthDB/scripture-links/releases/download/v1.2.0/scripture-links-aarch64-apple-darwin.tar.gz"
      sha256 "037c6ff27bca37d328e7f0c96c3a4ad2334383f9f039ac46e734d358e0e53897"
    else
      url "https://github.com/GarthDB/scripture-links/releases/download/v1.2.0/scripture-links-x86_64-apple-darwin.tar.gz"
      sha256 "7000cad684fdf52202f42074ad3a54ee1e7971321d661f6eca110e277a118aad"
    end
  end

  on_linux do
    url "https://github.com/GarthDB/scripture-links/releases/download/v1.2.0/scripture-links-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6176229af723e93bd7a216c1bfe83bffcb466558ca19e4f0545063c961fa218d"
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
