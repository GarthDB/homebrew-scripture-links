class ScriptureLinks < Formula
  desc "Convert scripture references to URLs for ChurchofJesusChrist.org"
  homepage "https://github.com/GarthDB/scripture-links"
  version "1.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GarthDB/scripture-links/releases/download/v1.2.1/scripture-links-aarch64-apple-darwin.tar.gz"
      sha256 "cb1548c0041b47bea8d4c72baebd0349afb6fc8f4e0db0c3bc79c2f668905f99"
    else
      url "https://github.com/GarthDB/scripture-links/releases/download/v1.2.1/scripture-links-x86_64-apple-darwin.tar.gz"
      sha256 "71dfffff6eaac599bc45eba89b9512977abd7e461d58770b9e0c55437bf28f41"
    end
  end

  on_linux do
    url "https://github.com/GarthDB/scripture-links/releases/download/v1.2.1/scripture-links-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fe1cce9531ddc275da6145b1dd2c53aaad5107b8a83c319891d4c62e971b4df2"
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
