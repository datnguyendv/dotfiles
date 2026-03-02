#!/bin/bash

# Stop script immediately on error
set -e

# --- CONFIGURATION ---
# Get the directory where this script is located
DOTFILES_DIR="$(
  cd -- "$(dirname "$0")" >/dev/null 2>&1
  pwd -P
)"
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 Starting dotfiles setup from: $DOTFILES_DIR${NC}"

# --- STEP 2: INSTALL OH MY ZSH & POWERLEVEL10K ---
echo -e "${YELLOW}⚡ Step 2: Installing Oh My Zsh & Powerlevel10k...${NC}"

# 2.1 Install Oh My Zsh (if not exists)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "   Installing Oh My Zsh..."
  # --unattended keeps it from dropping into a new shell shell
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "   ✅ Oh My Zsh is already installed."
fi

# 2.2 Install Powerlevel10k Theme
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
  echo "   Cloning Powerlevel10k..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
else
  echo "   ✅ Powerlevel10k is already installed."
fi

# --- STEP 3: INSTALL PLUGINS ---
echo -e "${YELLOW}🔌 Step 3: Installing Zsh Plugins...${NC}"

# 3.1 Install zsh-syntax-highlighting
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  echo "   Cloning zsh-syntax-highlighting..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
else
  echo "   ✅ zsh-syntax-highlighting is already installed."
fi

# 3.2 Install zsh-autosuggestions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  echo "   Cloning zsh-autosuggestions..."
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
else
  echo "   ✅ zsh-autosuggestions is already installed."
fi

# --- STEP 4: CREATE SYMLINKS (EXCLUDING .GIT) ---
echo -e "${YELLOW}🔗 Step 4: Creating Symlinks (Skipping .git)...${NC}"

# Change to the dotfiles directory
cd "$DOTFILES_DIR"

# Loop through all hidden files
for file in .*; do
  # EXCLUSION LIST:
  # 1. "." and ".." (current/parent directory)
  # 2. ".git" (Git metadata folder)
  # 3. ".DS_Store" (macOS metadata)
  if [[ "$file" == "." || "$file" == ".." || "$file" == ".git" || "$file" == ".DS_Store" ]]; then
    continue
  fi

  # Target path in Home directory
  TARGET="$HOME/$file"

  # Remove existing file/folder at target to allow symlinking
  if [ -e "$TARGET" ] || [ -L "$TARGET" ]; then
    echo "   🗑️  Removing old config: $TARGET"
    rm -rf "$TARGET"
  fi

  # Create the symlink
  echo "   🔗 Linking: $DOTFILES_DIR/$file -> $TARGET"
  ln -s "$DOTFILES_DIR/$file" "$TARGET"
done

echo -e "${GREEN}✅ Setup complete! Please restart your terminal or run:${NC}"
echo -e "${BLUE}source ~/.zshrc${NC}"
