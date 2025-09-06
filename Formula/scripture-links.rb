class ScriptureLinks < Formula
  desc "Convert scripture references to URLs for ChurchofJesusChrist.org"
  homepage "https://github.com/GarthDB/scripture-links"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GarthDB/scripture-links/releases/download/v1.1.0/scripture-links-aarch64-apple-darwin.tar.gz"
      sha256 "2b7d31547aa5a9719cb511a156f10b331d36932af01dc8777dd79f556d526be9"
    else
      url "https://github.com/GarthDB/scripture-links/releases/download/v1.1.0/scripture-links-x86_64-apple-darwin.tar.gz"
      sha256 "e82e1f4e30259397fe111bf5139e94782579f21687d827bbd1faf0f1bc3e789f"
    end
  end

  on_linux do
    url "https://github.com/GarthDB/scripture-links/releases/download/v1.1.0/scripture-links-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ccde4ef21cc2c5ef25983219a25e9f6f0b0ba22d69b76a90daa3ae6463b1a797"
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
