#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"
git pull origin master

function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
		--exclude "README.md" --exclude "LICENSE-MIT.txt" --exclude "Brewfile" \
		-av --no-perms . ~
	# Permissions
	sudo chgrp -R admin /usr/local
	sudo chmod -R g+w /usr/local
	sudo chown -R 'whoami' /Library/Caches/Homebrew
	sudo chown -R 'whoami' ~/Library/Caches/Homebrew
	
	# Execute Bash Profile
	source ~/.bash_profile

	# Install all the Homebrew stuff :)
	brew bundle
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
