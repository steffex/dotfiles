#!/bin/sh

echo "Installing .profile"
if [ -f ~/.profile ]; then
    mv ~/.profile ~/.profile_backup
fi
ln -s ~/dotfiles/.profile ~/.profile
echo "Done!"

echo "Installing git config..."
if [ -f ~/.gitconfig ]; then
    rm ~/.gitconfig
fi
ln -s ~/dotfiles/git/.gitconfig ~/.gitconfig
echo "Done!"

echo "Creating global gitignore..."
if [ -f ~/dotfiles/git/gitignore-global ]; then
    rm ~/dotfiles/git/gitignore-global
fi

ignore_list="CakePHP Composer Objective-C Swift Python Global/Archives Global/OSX Global/SublimeText Global/Xcode Global/Vagrant Global/vim Global/VirtualEnv"

cd git
for ignore in $ignore_list; do
    dir="gitignores/"
    file_path="$dir$ignore.gitignore"
    if [ -f $file_path ]; then
        echo "# Source file: $ignore.gitignore\n#########################\n" >> gitignore-global
        cat $file_path >> gitignore-global
        echo "\n" >> gitignore-global
    fi
done
cd ..
echo "Done!"

sh osx-settings.sh
