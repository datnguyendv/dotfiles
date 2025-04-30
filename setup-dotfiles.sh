#!/bin/bash

set -e # Exit immediately if a command exits with a non-zero status
set -u # Treat unset variables as an error

echo "🚀 Starting dotfiles setup..."

# 1. Clone Dotfiles Repository
echo "📁 Cloning dotfiles repository into ~/config/..."
git clone git@github.com:datnguyendv/dotfiles.git ~/config/

# 2. Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
	echo "💡 Installing Oh My Zsh..."
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
	echo "✅ Oh My Zsh already installed."
fi

# 2b. Install Powerlevel10k Theme
echo "🎨 Installing Powerlevel10k theme..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
	"${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

# 3. Navigate to dotfiles directory
cd ~/config/dotfiles

# 4. Install dependencies via Homebrew
if command -v brew &>/dev/null; then
	echo "🍺 Installing dependencies via Homebrew..."
	brew bundle install
else
	echo "❌ Homebrew is not installed. Please install it first: https://brew.sh"
	exit 1
fi

# 5. Create symbolic links (careful: could overwrite)
echo "🔗 Creating symbolic links to home directory..."
for file in ~/config/dotfiles/.*; do
	filename=$(basename "$file")
	[[ "$filename" == "." || "$filename" == ".." || "$filename" == ".git" ]] && continue
	ln -sf "$file" "$HOME/$filename"
done

# 6. Remove or override .git symlink
echo "🧹 Resetting .git link to avoid repo tracking in home..."
ln -F ~/config/dotfiles/.git ~/.git 2>/dev/null || true

# 7. Apply Zsh config
echo "🔁 Sourcing .zshrc..."
source ~/.zshrc

echo "✅ Dotfiles setup complete!"
