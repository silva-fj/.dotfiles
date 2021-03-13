# .dotfiles

The dotfiles are managed with GNU Stow

- install GNU Stow:

`brew install stow`

- To add new symlinks create a folder with a directory structure of the real file

e.g:

`nvim/.config/init.vim`

NOTE: `nvim` simulates $HOME directory

- Check what you want to install:

`stow -nvt ~ nvim`

This command will not make any changes, it will only output the result of installing nvim in the $HOME directory (specified by '~')

- Copy the config files/directories from $HOME to .dotfiles

`stow --adopt -nvt ~ nvim`

NOTE: to actually run the command with no simulation remove the `n`

`stow --adopt -vt ~ nvim`

- Check that the symlinks are created

`ls -all`

- To uninstall the symlinks:
  `stow -nvDt ~ *`

- To install .dotfiles in a new computer:

```
git clone git@github.com:franjs/.dotfiles.git
cd .dotfiles
stow -nvSt ~ * // for everything
stow -nvSt ~ nvim zsh // to manually select what to install
```

source: https://www.youtube.com/watch?v=CFzEuBGPPPg&t=1219s&ab_channel=DevInsideYou
