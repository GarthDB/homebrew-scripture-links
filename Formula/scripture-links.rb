class ScriptureLinks < Formula
  desc "Convert scripture references to URLs for ChurchofJesusChrist.org"
  homepage "https://github.com/GarthDB/scripture-links"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GarthDB/scripture-links/releases/download/v1.0.0/scripture-links-aarch64-apple-darwin.tar.gz"
      sha256 "95fb228a13a7b329ef816be408711e5ed88c59e4e375d4f00ac46efa4bd1a635"
    else
      url "https://github.com/GarthDB/scripture-links/releases/download/v1.0.0/scripture-links-x86_64-apple-darwin.tar.gz"
      sha256 "58a1f5a6c447d8a0dcabde01a57d9bd675fd709c6a4a3a46aaa88ab5c347a44a"
    end
  end

  on_linux do
    url "https://github.com/GarthDB/scripture-links/releases/download/v1.0.0/scripture-links-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b8dd23a2d7f7bfb86095481d9f399f38e0ed0ec9116983e3b9cc7c0884076635"
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
