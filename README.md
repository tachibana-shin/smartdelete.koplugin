# SmartDelete KOReader Plugin

**SmartDelete** is a KOReader plugin that enhances file deletion safety by prompting users before deleting files, with special attention to book data such as bookmarks and reading history.

## Features

- Overrides the default file deletion dialog in KOReader's File Manager.
- Warns users when deleting files that have associated book data (settings, highlights, notes).
- Offers an additional "Delete Only" option for files, allowing users to remove just the file while keeping other information intact.
- Localized messages (English, Vietnamese, Japanese).

  <img width="598" height="697" alt="image" src="https://github.com/user-attachments/assets/1126afe3-81e6-4ad6-b5fb-fb384c8f6b80" />


## Installation

1. Download or clone this repository.
2. Copy the `smartdelete.koplugin` folder into your KOReader's `plugins` directory, typically found at:
   ```
   koreader/plugins/
   ```
3. Restart KOReader.

## Usage

- Open KOReader's File Manager.
- Attempt to delete a file or folder.
- The SmartDelete dialog will appear, providing extra information and options if the file has associated book data.

## Localization

The plugin currently supports:
- English (default)
- Vietnamese
- Japanese

You can add more translations by editing `i18n.lua`.

## License

Creative Commons Legal Code

## Author

Tachibana Shin (<tachibshin@duck.com>)

[GitHub Repository](https://github.com/tachibana-shin/smartdelete.koplugin)
