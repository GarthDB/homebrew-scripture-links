class ScriptureLinks < Formula
  desc "Convert scripture references to URLs for ChurchofJesusChrist.org"
  homepage "https://github.com/GarthDB/scripture-links"
  version "1.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GarthDB/scripture-links/releases/download/v1.2.1/scripture-links-aarch64-apple-darwin.tar.gz"
      sha256 "29b41a982f89c70e9ad0b6636b81a0b7c036f08c0c5329967e2ac04cf62b35db"
    else
      url "https://github.com/GarthDB/scripture-links/releases/download/v1.2.1/scripture-links-x86_64-apple-darwin.tar.gz"
      sha256 "a02a33c7f5aba408fd882c9f8e1964cf9e19c83a1bac674d7ba06f7a54a80387"
    end
  end

  on_linux do
    url "https://github.com/GarthDB/scripture-links/releases/download/v1.2.1/scripture-links-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "60e22644e454715877bd6359a2328c3b606c1a782baed8cc7226ba41d55002fa"
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
