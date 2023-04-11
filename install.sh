# Install Brew
echo "Installing Brew..."
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Adding Brew Taps
brew tap homebrew/cask-fonts

# Install Brew Formulae
echo "Installing Brew Formulae..."
brew install alacritty
brew install fish
brew install neovim
brew install yabai
brew install sketchybar

# Dependencies for sketchybar config
# brew tap homebrew/cask-fonts
brew install jq
brew install gh
brew install switchaudio-osx

# Install Brew Casks
echo "Installing Brew Casks..."
brew install --cask font-hack-nerd-font

# Dependencies for sketchybar config
brew install --cask sf-symbols

# Installing fonts
echo "Installing fonts..."

# Dependencies for sketchybar config
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.3/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf

# Setup fish shell
echo "Setting up fish as shell"
echo "/opt/homebrew/bin/fish" >> /etc/shells
chsh -s /opt/homebrew/bin/fish

# Install AstroVim
echo "Installing AstroVim"
git clone --depth 1 "https://github.com/AstroNvim/AstroNvim" "$HOME/.config/nvim"

# Create config symlinks
echo "Creating configurations symlinks..."
ln -s "$PWD/alacritty" "$HOME/.config"
ln -s "$PWD/skhd" "$HOME/.config"
ln -s "$PWD/yabai" "$HOME/.config"
ln -s "$PWD/fish" "$HOME/.config"

rm -r "$HOME/.config/nvim/lua/user" # Make sure user folder does not exist
ln -s "$PWD/astronvim_config" "$HOME/.config/nvim/lua/user"

echo "Starting Services"
brew services start skhd
brew services start yabai
brew services start sketchybar 
