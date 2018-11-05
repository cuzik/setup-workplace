# Config Terminator
echo '[global_config]' >> ~/.config/terminator/config
echo 'use_custom_command=True' >> ~/.config/terminator/config
echo 'custom_command=/bin/zsh -l' >> ~/.config/terminator/config

# Config rvm on .zshrc
echo 'export PATH="$PATH:$HOME/.rvm/bin"' >> ~/.zshrc