return {
    name = "SmartDelete",
    display_name = "Smart Delete",
    description = "Ask user before deleting book data (bookmarks, reading history).",
    author = "Tachibana Shin <tachibshin@duck.com>",
    version = "1.0.0",
    supported_platforms = { "all" },
    require_version = 20240301, -- minimal KOReader version (adjust if needed)
    license = "GPLv3",
    homepage = "https://github.com/tachibana-shin/smartdelete",
    category = "File Management",
    priority = 100, -- higher = loaded earlier
}
