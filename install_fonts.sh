# Create directory to hold user fonts
mkdir -p ~/.local/share/fonts
cp resources/SFMono/* ~/.local/share/fonts
sudo fc-cache -f -v