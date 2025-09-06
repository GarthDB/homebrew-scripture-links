class ScriptureLinks < Formula
  desc "Convert scripture references to URLs for ChurchofJesusChrist.org"
  homepage "https://github.com/GarthDB/scripture-links"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GarthDB/scripture-links/releases/download/v1.1.0/scripture-links-aarch64-apple-darwin.tar.gz"
      sha256 "d741b8c7b744587bd3259dfe7e4e3a859483a4ecfc4d2d7b51ecccc972726244"
    else
      url "https://github.com/GarthDB/scripture-links/releases/download/v1.1.0/scripture-links-x86_64-apple-darwin.tar.gz"
      sha256 "08299b4b27291413280d88ae761df3f407c9ff590299db95c8df9dd8bb027a6d"
    end
  end

  on_linux do
    url "https://github.com/GarthDB/scripture-links/releases/download/v1.1.0/scripture-links-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "68c2bc2d966b7cf789a24c7ac4ee0392052ab479479ae8e1ee1d957f1aabdde2"
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
