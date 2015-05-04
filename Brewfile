# Update the Homebrew
brew update

# Update the installed formula
brew upgrade

# Install GNU Core utilities(Replaces BSD Coreutils with GNU Coreutils)
brew install coreutils
brew install moreutils
brew install findutils

echo 'export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"' >> ~/.zshrc
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

# Install Bash 4
brew install bash

# Install VIM
brew install vim

# Instal rbEnv
# brew install rbenv ruby-build
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.zshrc

# rbenv install 2.2.2
# rbenv global 2.2.2

# Install wget
brew install wget --enable-iri

# PHP 5.5
brew tap homebrew/php
brew tap homebrew/dupes

brew install php55 
brew install php55-xdebug

# PHP Laravel
brew install composer
brew install php55-mcrypt

brew install ack
brew install pv
brew install git
brew install imagemagick --with-wepp
brew install lynx
brew install node
brew install pigz
brew install rename
brew install rhino
brew install tree
brew install webkit2png
brew install zopfli
brew install p7zip

# Tmux
brew install tmux
brew install reattach-to-user-namespace

# Install Homebrew Cask
brew install phinze/cask/brew-cask
brew tap caskroom/versions

apps=(
dropbox
firefox
google-chrome
google-chrome-canary
iterm2
virtualbox
vagrant
vlc
the-unarchiver
sequel-pro
skype
android-file-transfer
evernote
sqlite-database-browser
spotify
)

brew cask install ${apps[@]}

# Remove outdated versions from the cellar
brew cleanup