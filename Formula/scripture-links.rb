class ScriptureLinks < Formula
  desc "Convert scripture references to URLs for ChurchofJesusChrist.org"
  homepage "https://github.com/GarthDB/scripture-links"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GarthDB/scripture-links/releases/download/v1.1.0/scripture-links-aarch64-apple-darwin.tar.gz"
      sha256 "ce24357a2fbebf34acba0bb8eaba3e2b17eee11fb901fc28765c058b5af92bec"
    else
      url "https://github.com/GarthDB/scripture-links/releases/download/v1.1.0/scripture-links-x86_64-apple-darwin.tar.gz"
      sha256 "7e02ab3114388596007ea749b05a18113bd690a537bcac6d03228abb6412b875"
    end
  end

  on_linux do
    url "https://github.com/GarthDB/scripture-links/releases/download/v1.1.0/scripture-links-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c9d7f0532b213672a64225ea8016aac153cb7ae00d2b33514bf617b9cbd5675c"
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
