# .dotfiles

Personal .dotfiles

## Useful Stow Commands
```sh
stow */       # stow targetting only directories
stow <file>   # stow file
stow *        # stow all
stow .        # stow all including subdirectories
stow -D .     # delete symbolic links
stow -R .     # delete and recreate symbolic links
```


## .keystrings
- swap `Escape` and `CapsLock` in tty

```sh
sudo loadkeys ~/.keystrings
```

## .inputrc
- terminal cursor is fat in normal mode and skinny in insert mode
