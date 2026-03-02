#!/bin/bash

# Stop script immediately on error
set -e

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# --- CONFIGURATION ---
FONT_ZIP_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Meslo.zip"
FONT_DIR="$HOME/Library/Fonts"
TEMP_DIR=$(mktemp -d) # Create a temporary directory in /tmp

echo -e "${BLUE}🅰️  Starting Meslo Nerd Font installation...${NC}"

# 1. Download
echo -e "${YELLOW}⬇️  Downloading Meslo.zip (v3.4.0)...${NC}"
# -L: Follow redirects | --silent: Hide progress bar | --show-error: Show errors if fails
curl -L "$FONT_ZIP_URL" -o "$TEMP_DIR/Meslo.zip" --silent --show-error

# 2. Extract
echo -e "${YELLOW}📦 Extracting files...${NC}"
# -q: quiet mode
unzip -q "$TEMP_DIR/Meslo.zip" -d "$TEMP_DIR/Meslo"

# 3. Install (Move to User Fonts)
echo -e "${YELLOW}📂 Installing fonts to $FONT_DIR...${NC}"

# Ensure the font directory exists
mkdir -p "$FONT_DIR"

# Find all .ttf or .otf files (case insensitive) and copy them to Library/Fonts
find "$TEMP_DIR/Meslo" \( -iname "*.ttf" -o -iname "*.otf" \) -exec cp {} "$FONT_DIR/" \;

# 4. Cleanup
echo -e "${YELLOW}🧹 Cleaning up temporary files...${NC}"
rm -rf "$TEMP_DIR"

echo -e "${GREEN}✅ Font installation complete!${NC}"
echo -e "You can now verify the fonts in the macOS Font Book app."
