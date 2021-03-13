# .dotfiles Management

The dotfiles are managed with GNU Stow

## install GNU Stow:

`brew install stow`

NOTE: The `-n` argument in the commands only simulates the operation by showing the output of what's going to do.

To actually execute te command remove the `n` from the arguments.

## Install .dotfiles:

```
git clone git@github.com:franjs/.dotfiles.git
cd .dotfiles
stow -nvSt ~ *
```

To install only specific config files: `stow -nvSt ~ nvim zsh`

#### To add new symlinks create a folder with a directory structure of the real file:

`~/.dotfiles/nvim/.config/init.vim`

NOTE: `nvim` simulates `$HOME` directory

then run: `stow -nvt ~ nvim` to create the symlink

#### If the config files already exist and you want to add them to .dotfiles:

create and empty file in `.dotfiles` with the real directory structure:

`~/.dotfiles/nvim/.config/init.vim`

Then run:

`stow --adopt -nvt ~ nvim`

This command will move the real files to `.dotfiles` and create the symlinks

#### Check that the symlinks are created

`ls -all`

#### To uninstall the symlinks:

`stow -nvDt ~ *`


Tutorial: https://www.youtube.com/watch?v=CFzEuBGPPPg&t=1219s&ab_channel=DevInsideYou
