#!/bin/sh

echo 'Changing OS X default settings...'

# Use AirDrop over every interface. srsly this should be a default.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Always open everything in Finder's list view. This is important.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Show the ~/Library folder.
chflags nohidden ~/Library

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# When performing a search in Finder, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Save screenshots to folder ~/Pictures/screenshots
if [ ! -d "~/Pictures/screenshots"]; then
	mkdir "~/Pictures/screenshots"
fi
defaults write com.apple.screencapture location ~/Pictures/screenshots/

killall SystemUIServer

# Dock settings:
################

# Set dock to left
defaults write com.apple.dock orientation -string left

# Set dock size to smallest
defaults write com.apple.dock tilesize -int 24

# Autohide dock
defaults write com.apple.dock autohide -bool true

# Minimize apps to application icon
defaults write com.apple.dock minimize-to-application -bool true

# Turn of magnification
defaults write com.apple.dock magnification -bool false

# Restart the dock
killall Dock

echo 'Done!'
