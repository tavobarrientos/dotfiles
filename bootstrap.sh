#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"
# git pull origin master

function doIt() {
	# Install Oh my zsh
	printf "Instaling Oh-my-Zsh"
	curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
	if [[ -f /etc/zshenv ]]; then
  		printf "Fixing OSX zsh environment bug ..."
    	sudo mv /etc/{zshenv,zshrc}
	fi
	
	if [[ `uname` == 'Darwin' ]]; then
		# Homebrew is installed?
		if !command -v brew &>/dev/null; then
			# Install Homebrew
			ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
			
			if !grep -qs "brew doctor"  ~/.zshrc; then
				printf "Exporting Zsh to PATH"
				export PATH="/usr/local/bin:$PATH"
			fi
		else
			printf "Homebrew already installed"
		fi
		
		# Fix Homebrew Permissions
		sudo chgrp -R admin /usr/local
		sudo chmod -R g+w /usr/local
		sudo chown -R `whoami` /Library/Caches/Homebrew
		sudo chown -R `whoami` ~/Library/Caches/Homebrew

		# Install all the Homebrew stuff :)
		sh Brewfile
		# OSX Tweaks
		source ~/.osx
	fi
	
	# Execute Bash Profile
	source ~/.bash_profile
	source ~/.zshrc
	
	# Copy the dotfiles to Home Directory
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
		--exclude "README.md" --exclude "LICENSE-MIT.txt" --exclude "Brewfile" \
		-av --no-perms . ~
	
	# Clone Submodules
	git submodule update
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt
