#!/bin/bash

USERNAME=$(whoami)

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo >> /Users/$USERNAME/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$USERNAME/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Install command line tools

# install zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Open ~/.zshrc, find the line that sets ZSH_THEME, and change its value to "powerlevel10k/powerlevel10k".
sed -i '' 's/^ZSH_THEME=.*$/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

sudo chown -R $(whoami) /usr/local/bin
source ~/.zshrc


# install zsh-autosuggestions, zsh-syntax-highlighting and append in plugins in zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
if ! grep -q "zsh-autosuggestions" ~/.zshrc; then
  sed -i '' 's/^plugins=(\(.*\))/plugins=(\1 zsh-autosuggestions)/' ~/.zshrc
fi

if ! grep -q "zsh-syntax-highlighting" ~/.zshrc; then
  sed -i '' 's/^plugins=(\(.*\))/plugins=(\1 zsh-syntax-highlighting)/' ~/.zshrc
fi

source ~/.zshrc

# configure git
git config --global user.name "$GIT_USERNAME"
git config --global user.email "$GIT_EMAIL"

# ssh
ssh-keygen -t ed25519 -C "$GIT_EMAIL"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
pbcopy < ~/.ssh/id_ed25519.pub
echo "SSH key copied to clipboard. Please add it to your GitHub account - https://github.com/settings/keys"
read -p "Press enter to continue"

# Install NVM (Node Version Manager) and Node LTS
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install --lts
nvm use --lts
node -v
npm -v


# Show hidden files in Finder
defaults write com.apple.finder AppleShowAllFiles -bool true
# Restart Finder to apply changes
killall Finder

echo "Setup complete! Please restart your terminal to apply the changes."