class ScriptureLinks < Formula
  desc "Convert scripture references to URLs for ChurchofJesusChrist.org"
  homepage "https://github.com/GarthDB/scripture-links"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GarthDB/scripture-links/releases/download/v1.2.0/scripture-links-aarch64-apple-darwin.tar.gz"
      sha256 "fa47dbaabccd38e91d49aa976032908b3e91de49544cbb6591715f73f43d3b5e"
    else
      url "https://github.com/GarthDB/scripture-links/releases/download/v1.2.0/scripture-links-x86_64-apple-darwin.tar.gz"
      sha256 "9441da18fa411259fc4b43fe1a3f715f947d7edac98889e135b6c078fdbb050c"
    end
  end

  on_linux do
    url "https://github.com/GarthDB/scripture-links/releases/download/v1.2.0/scripture-links-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6cd15b8d344c18719e4a142b2f50c1c436303c484710a0494884e1114deadac4"
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
