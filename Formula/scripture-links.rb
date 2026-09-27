class ScriptureLinks < Formula
  desc "Convert scripture references to URLs for ChurchofJesusChrist.org"
  homepage "https://github.com/GarthDB/scripture-links"
  version "1.2.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/GarthDB/scripture-links/releases/download/v1.2.4/scripture-links-aarch64-apple-darwin.tar.gz"
      sha256 "c8a9dbde3c42ac1043268ca248e77dd313f6f9cf566d5e25b4b5a2fd9cb6a1ed"
    else
      url "https://github.com/GarthDB/scripture-links/releases/download/v1.2.4/scripture-links-x86_64-apple-darwin.tar.gz"
      sha256 "6aaace0e63305433644f5fc1bcd26c6450dc59dec7f75cdd23da36bcc14a3e07"
    end
  end

  on_linux do
    url "https://github.com/GarthDB/scripture-links/releases/download/v1.2.4/scripture-links-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "018f0fbde61821eca7d1f641c4ed5151d74471d6e8cc86981278561e94412a4b"
  end

  def install
    bin.install "scripture-links"
  end

  test do
    output = shell_output("#{bin}/scripture-links --reference 'Genesis 1:1'")
    assert_match "https://www.churchofjesuschrist.org/study/scriptures/ot/gen/1", output

    help_output = shell_output("#{bin}/scripture-links --help")
    assert_match "Generate links to scriptures on ChurchofJesusChrist.org", help_output
  end
end
