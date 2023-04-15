# Software Selection
echo "Install Alacritty? (y/n)"
read alacritty 

echo "Install Fish? (y/n)"
read fish 

echo "Install NeoVim? (y/n)"
read nvim 

echo "Install Yabai? (y/n)"
read yabai 

echo "Install SketchyBar? (y/n)"
read sketchybar 

echo "Install skhd? (y/n)"
read skhd

echo "Install Spicetify (y/n)"
read spicetify 

# Install Brew
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Adding Brew Taps
brew tap homebrew/cask-fonts

# Install Brew Formulae
echo "Installing Brew Formulae..."
if [[ $alacritty == "y" ]]; then
    brew install alacritty
fi
if [[ $fish == "y" ]]; then
    brew install fish
fi
if [[ $nvim == "y" ]]; then
    brew install neovim
fi
if [[ $yabai == "y" ]]; then
    brew install yabai
fi
if [[ $skhd == "y" ]]; then
    brew install skhd 
fi
if [[ $sketchybar == "y" ]]; then
    brew install sketchybar
    # Dependencies for sketchybar config
    brew install jq
    brew install gh
    brew install switchaudio-osx
fi
if [[ $nvim == "y" ]]; then
    brew install nvim 
fi

# Install Apps
brew install neofetch


# Install Brew Casks
echo "Installing Brew Casks..."
brew install --cask font-hack-nerd-font

if [[ $sketchybar == "y" ]]; then
    # Dependencies for sketchybar config
    brew install --cask sf-symbols
fi

# Installing fonts
echo "Installing fonts..."
if [[ $sketchybar == "y" ]]; then
    # Dependencies for sketchybar config
    curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.3/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf
fi

# Setup fish shell
if [[ $fish == "y" ]]; then
    echo "Setting up fish as shell"
    echo "/opt/homebrew/bin/fish" >> /etc/shells
    chsh -s /opt/homebrew/bin/fish
fi

# Install AstroVim
if [[ $nvim == "y" ]]; then
    echo "Installing AstroVim"
    git clone --depth 1 "https://github.com/AstroNvim/AstroNvim" "$HOME/.config/nvim"
fi


if [[ $spicetify == "y" ]]; then
    echo "Installing Spicetcurl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.sh | sh"
fi

# Create config symlinks
echo "Creating configurations symlinks..."
if [[ $alacritty == "y" ]]; then
    ln -s "$PWD/alacritty" "$HOME/.config"
fi
if [[ $fish == "y" ]]; then
    ln -s "$PWD/fish" "$HOME/.config"
fi
if [[ $nvim == "y" ]]; then
    rm -r "$HOME/.config/nvim/lua/user" # Make sure user folder does not exist
    ln -s "$PWD/astronvim_config" "$HOME/.config/nvim/lua/user"
fi
if [[ $yabai == "y" ]]; then
    ln -s "$PWD/yabai" "$HOME/.config"
fi
if [[ $skhd == "y" ]]; then
    ln -s "$PWD/skhd" "$HOME/.config"
fi
if [[ $sketchybar == "y" ]]; then
    ln -s "$PWD/sketchybar" "$HOME/.config"
fi
if [[ $spicetify == "y" ]]; then
    rm -r "$HOME/.config/spicetify/Extensions"
    ln -s "$PWD/spicetify/catppuccin-mocha" "$HOME/.config/spicetify/Themes"
    ln -s "$PWD/spicetify/js" "$HOME/.config/spicetify/Extensions"
fi

echo "Starting Services"
if [[ $yabai == "y" ]]; then
    brew services start yabai
fi
if [[ $skhd == "y" ]]; then
    brew services start skhd
fi
if [[ $sketchybar == "y" ]]; then
    brew services start sketchybar 
fi


