class ScriptureLinks < Formula
  desc "Convert scripture references to URLs for ChurchofJesusChrist.org"
  homepage "https://github.com/GarthDB/scripture-links"
  version "1.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GarthDB/scripture-links/releases/download/v1.2.1/scripture-links-aarch64-apple-darwin.tar.gz"
      sha256 "2f2fb9024c986bdb8af298103c6f13097586ad7e18625e624463a538ec644a5a"
    else
      url "https://github.com/GarthDB/scripture-links/releases/download/v1.2.1/scripture-links-x86_64-apple-darwin.tar.gz"
      sha256 "8c87ee47ffb635372016b6260c2bf39bbf5e4bb0148229cd0b804b190f239166"
    end
  end

  on_linux do
    url "https://github.com/GarthDB/scripture-links/releases/download/v1.2.1/scripture-links-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1649ef7e6653404b65307b4ff43bde74d8e9e4f7c2ce50e6f1690f621da2ad98"
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
