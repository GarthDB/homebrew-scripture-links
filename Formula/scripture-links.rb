class ScriptureLinks < Formula
  desc "Convert scripture references to URLs for ChurchofJesusChrist.org"
  homepage "https://github.com/GarthDB/scripture-links"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GarthDB/scripture-links/releases/download/v1.2.0/scripture-links-aarch64-apple-darwin.tar.gz"
      sha256 "c77658c7e26816e3008abf19d2f5a9168e0d2aaa61b74c223875662ad26ad4c5"
    else
      url "https://github.com/GarthDB/scripture-links/releases/download/v1.2.0/scripture-links-x86_64-apple-darwin.tar.gz"
      sha256 "090136ede09427e65ea8db37bad5e42f9640e5391eca48eb3a53f678345e1992"
    end
  end

  on_linux do
    url "https://github.com/GarthDB/scripture-links/releases/download/v1.2.0/scripture-links-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3b87bfcb80ea9ed6f393c4d9ef4154edf09c2ead2ec1a72e70f2028dad1b182c"
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
