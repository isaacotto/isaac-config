**This is meant for use with GNU Stow.**

If all goes well, I should be able to run the command:

``$ stow --target=/home/<usr> <utilfolder>``

and it will automatically create the appropriate symlinks
to the files located in this folder. Then if I need to edit
the files, I can always access them via this folder.

If for some reason you want to stow everything at once, just
run the command:

``$ stow --target=/home/<usr> */``

using ``*/`` rather than ``*`` to match all directories
instead of all files. I'll also include a makefile that
accomplishes this in this same directory.

To remove all dotfile-related symlinks from the machine,
just run the command:

``$ make delete``

**Requirements**

***Kitty***

- Inconsolata Nerd Font

- trash (trash-cli)

- logo-ls
    
    This will probably require a fix 
    https://github.com/Yash-Handa/logo-ls/issues/49
    which involves running the following script to
    allow the nerd font symbols to map to the icons
    in logo-ls:

``curl https://raw.githubusercontent.com/UTFeight/logo-ls-modernized/master/INSTALL | bash``

