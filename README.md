Clone into ~/config/dotfiles

git clone git@github.com:datnguyendv/dotfiles.git > ~/config

clone oh-my-zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

clone powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

go to dotfiles config
install dependancy by brew:
brew bundle install

link to home resource
ln -s ~/config/dotfiles/.\* ~/

remove link .git
ln -F .git
