class ScriptureLinks < Formula
  desc "Convert scripture references to URLs for ChurchofJesusChrist.org"
  homepage "https://github.com/GarthDB/scripture-links"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GarthDB/scripture-links/releases/download/v1.1.0/scripture-links-aarch64-apple-darwin.tar.gz"
      sha256 "fb2e71106a250b2c893393eaf2230398544fcb0591b7835a6fefe4a696e3add9"
    else
      url "https://github.com/GarthDB/scripture-links/releases/download/v1.1.0/scripture-links-x86_64-apple-darwin.tar.gz"
      sha256 "ab1c261c07f9098d8739f41ec96556de3c796b46484499c34356ec69fc21957c"
    end
  end

  on_linux do
    url "https://github.com/GarthDB/scripture-links/releases/download/v1.1.0/scripture-links-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "20567bf3713b7aa5d349f22c0f5e16f2bf4208ad4bf2e66ee892b009262a01f7"
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
