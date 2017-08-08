# Import options variables
source options.sh

# Ensure no interactive post-install prompts appear
export DEBIAN_FRONTEND=noninteractive

# Add apt source for Sublime Text 3 from stable channel
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# Add apt source for Google Chrome from stable channel
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

# Update Packages
apt-get update

# Install listed packages from 'packages.txt'
apt-get install $(grep -vE "^\s*#" packages.txt  | tr "\n" " ") -y
apt-get upgrade -y

# Set up git global config with username and email
git config --global user.email $EMAIL
git config --global user.name $GIT_USERNAME

# Set git to use simple pushing and squelch warning on pushes
git config --global push.default simple
