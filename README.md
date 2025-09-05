# Homebrew Tap for Scripture Links

This is a [Homebrew](https://brew.sh/) tap for the [scripture-links](https://github.com/GarthDB/scripture-links) CLI tool.

## Installation

```bash
# Add the tap
brew tap garthdb/scripture-links

# Install the CLI tool
brew install scripture-links
```

## Usage

```bash
# Convert a single scripture reference
scripture-links --reference "Genesis 1:1"

# Process text with scripture references
scripture-links --text "See Genesis 1:1 and 2 Nephi 10:14 for insights."

# Process a file
scripture-links --file input.txt
```

## About Scripture Links

Scripture Links is a CLI tool that converts scripture references to URLs for [ChurchofJesusChrist.org](https://www.churchofjesuschrist.org/study/scriptures). It supports:

- **Standard Works**: Old Testament, New Testament, Book of Mormon, Doctrine and Covenants, Pearl of Great Price
- **Multiple Formats**: Official abbreviations, full book names, case insensitive
- **Text Processing**: Find and convert all scripture references in text or files to markdown links
- **Validation**: Checks for valid chapters and verses

## Links

- **Main Repository**: [GarthDB/scripture-links](https://github.com/GarthDB/scripture-links)
- **Web Interface**: [garthdb.com/scripture-links](https://garthdb.com/scripture-links/)
- **CLI Releases**: [GitHub Releases](https://github.com/GarthDB/scripture-links/releases)

## License

MIT License - see the [main repository](https://github.com/GarthDB/scripture-links) for details.
