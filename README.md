# 🚀 Dotfiles Setup Guide

Automated configuration for macOS development environment using Zsh, Oh My Zsh, Powerlevel10k, and essential plugins.

## 📋 Prerequisites

Before running the installation script, please ensure you have the following:

1. **Git** installed on your system.
2. **iTerm2** installed (recommended terminal).
3. **MesloLGS NF Font**:
   - Download and install [MesloLGS NF](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k) (recommended for Powerlevel10k).
   - _Or generic Nerd Fonts:_ [NerdFonts.com](https://www.nerdfonts.com/font-downloads).
   - **Important:** Open iTerm2 Preferences -> Profiles -> Text -> Change Font to `MesloLGS NF`.

---

## 🛠 Installation

Follow these steps to set up your environment.

### 1. Clone the Repository

We will clone the dotfiles into `~/config/dotfiles`.

```bash
# Create the config directory
mkdir -p ~/config

# Clone the repository
git clone git@github.com:datnguyendv/dotfiles.git ~/config/dotfiles
```

### 2. Run the Setup Script

Navigate to the directory and run the installation script. This script is idempotent (safe to run multiple times).

```bash
cd ~/config/dotfiles

# Make the script executable
chmod +x setup-dotfiles.sh

# Run the script
./setup-dotfiles.sh
```

### 3. Apply Changes

Once the script finishes, restart your terminal or run:

```bash
source ~/.zshrc
```

## 🤖 What does the script do?

The `setup-dotfiles.sh` automates the following tasks:

1. **Installs Oh My Zsh:** The framework for managing your Zsh configuration.

2. **Installs Powerlevel10k:** A fast and flexible Zsh theme.

3. **Installs Plugins:**
   - **zsh-autosuggestions:** Suggests commands as you type based on history.

   - **zsh-syntax-highlighting:** Highlights commands while typing.

4. **Symlinks Dotfiles:**
   - Links all configuration files (starting with .) from ~/config/dotfiles to your home directory ~/.

   - Safety: It automatically backs up/removes old config files to avoid conflicts.

   - Exclusion: It strictly excludes .git and .DS_Store to keep your home directory clean.

## 🎨 iTerm2 Configuration

To get the full visual experience, you need to manually import the color schemes and keybindings included in this repo.

1. **Colors (Dracula):**
   - Open iTerm2.

   - Press `Cmd + ,` to open Preferences.

   - Go to **Profiles** -> **Colors**.

   - Click **Color Presets...** -> **Import...**

   - Select the file: `~/config/dotfiles/Dracula.itermcolors.`

2. **Keybindings:**
   - Go to **Profiles** -> **Keys**.

   - Click **Key Mappings** -> **Import...**

   - Select the file: `~/config/dotfiles/keybindings.itermkeymap.`
