# 🚀 Dotfiles Setup Guide

Instructions for installing and configuring dotfiles on macOS systems.

---

## 1. Clone Dotfiles Repository

```bash
git clone git@github.com:datnguyendv/dotfiles.git ~/config/
```

## 2. Install Oh My Zsh and Powerlevel10k

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
  "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
```

## 3. Navigate to the dotfiles directory

```bash
cd ~/config/dotfiles
```

## 4. Install dependencies via Homebrew

```bash
brew bundle install
```

## 5. Create symbolic links to the home directory

> Warning: Review the files before running this to avoid overwriting personal configs.

```bash
ln -s ~/config/dotfiles/.* ~/
```

## 6. Remove `.git` symlink (if needed)

```bash
ln -F ~/config/dotfiles/.git ~/.git
```

## 7. Apply config

```bash
source .zshrc
```

---

✅ **Done!**
