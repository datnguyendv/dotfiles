# 🚀 Dotfiles Setup Guide

Instructions for installing and configuring dotfiles on macOS systems.

Install `MesloLG Nerd font` in <https://www.nerdfonts.com/font-downloads>

File `keybindings.itermkeymap` and `Dracula.itermcolors` is using for iterm

Copy file `setup-dotfiles.sh` to your home path first

## ✅ Run `setup-dotfiles.sh`

This script automates the steps below to configure your development environment.

---

## 🔧 What the script does

### 1. Clone Dotfiles Repository

```bash
git clone git@github.com:datnguyendv/dotfiles.git ~/config/
```

### 2. Install Oh My Zsh and Powerlevel10k

**Install Oh My Zsh:**

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

**Install Powerlevel10k theme:**

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
```

### 3. Navigate to the dotfiles directory

```bash
cd ~/config/dotfiles
```

### 4. Install dependencies via Homebrew

```bash
brew bundle install
```

### 5. Create symbolic links to the home directory

> ⚠️ Warning: Review the files before running this to avoid overwriting personal configs.

```bash
ln -s ~/config/dotfiles/.* ~/
```

### 6. Remove `.git` symlink (if needed)

```bash
ln -F ~/config/dotfiles/.git ~/.git
```

### 7. Apply config

```bash
source .zshrc
```

---

✅ **All done!** You can now enjoy your customized shell environment.
