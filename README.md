# dotfiles
configuration dotfiles.


# Applying dotfiles to new device
1. Git clone Dotfiles project to home dir.
2. run `stow .` to apply all dotfiles.

# Add new application dotfiles
1. Create new "application" dir under ~/dotfiles/ (e.g. `mkdir ~/dotfiles/starship`).
   This dir is purely organisational.
2. Within the "application" dir, mirror the new dotfile's path as it appears relative to ~/
   (e.g. `mv ~/x/y/z/.dotfile ./dotfiles/<app-dir>/x/y/z/.dotfile` )
