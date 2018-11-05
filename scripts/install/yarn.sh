# Remove cmdtest
sudo apt remove cmdtest

# Download
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -

# Add to apt list
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

# Install yarn without node
sudo apt-get update
sudo apt-get install yarn

# Add configure to .zshrc
echo "# Uncomment if necessary" >> ~/.zshrc
echo '# export PATH="$PATH:/opt/yarn-[version]/bin"' >> ~/.zshrc