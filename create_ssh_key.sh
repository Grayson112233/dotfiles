# Make sure ~/.ssh exists, because ssh-keygen can't create the directory itself
mkdir ~/.ssh

source options.sh

# Generate the key with the given email and passphrase (if any)
ssh-keygen -t rsa -b 4096 -C "$EMAIL" -N "$KEY_PASSPHRASE" -f ~/.ssh/id_rsa

printf "Your new SSH public key is printed below:\n\n"
cat ~/.ssh/id_rsa.pub
printf "\n"

