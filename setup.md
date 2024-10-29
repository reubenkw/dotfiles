# Git
sudo apt install git

# Dotfiles
mkdir ~/dev
cd ~/stdev
git clone https://github.com/reubenkw/dotfiles.git
cd dotfiles
sudo apt install stow
rm ~/.bashrc
stow -t ~/ .

# Alacritty
https://github.com/alacritty/alacritty/blob/master/INSTALL.md

apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
sudo apt install cargo
cargo install alacritty

https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
mkdir -p ~/.local/share/fonts
cp -r ~/Downloads/JetBrainsMono ~/.local/share/fonts/

chmod +x ~/.local/share/applications/alacritty.desktop

# Nvim
sudo apt install neovim

# Tmux
sudo apt install tmux

# vscode
https://code.visualstudio.com/docs/setup/linux

# teams-for-linux
https://github.com/IsmaelMartinez/teams-for-linux
```
sudo mkdir -p /etc/apt/keyrings

sudo wget -qO /etc/apt/keyrings/teams-for-linux.asc https://repo.teamsforlinux.de/teams-for-linux.asc

echo "deb [signed-by=/etc/apt/keyrings/teams-for-linux.asc arch=$(dpkg --print-architecture)] https://repo.teamsforlinux.de/debian/ stable main" | sudo tee /etc/apt/sources.list.d/teams-for-linux-packages.list

sudo apt update

sudo apt install teams-for-linux
```
# Arduino IDE
https://www.arduino.cc/en/software
