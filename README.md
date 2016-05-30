#KiCad Library
### Convenience edition

This is the complete package.  Every component library, every footprint library, and every 3D model and other extras that are contained in the official [KiCad repositories](https://github.com/kicad), but in one aggregate repository.  Finally, getting a complete and ready-to-go KiCad environment, as well as keeping everything update, is ony slightly more painful than it ought to be!

This repository is not a mirror, but a repository of repositories, so cloning it will grab **the most update versions of all of the official support files**, no matter what.  The official repo list is also scraped every hour to check for new repositories that might have been added.  And, if needed, new repos are automatically added, and the fp-lib-table file regenerated to reflect the additions.

### How to use this repository 
##### (if you just git clone this, it will not work!)

This is meant to be cloned directly into the kicad library directory.  You may need to move the `$(prefix)/share/kicad` directory out of the way.  Note: `$(prefix)` is your KiCad install path.

On Windows and Linux:
```
git clone --recursive https://github.com/metacollin/kicad-library.git $(prefix)/share/kicad
```

On OS X:
```
sudo git clone --recursive https://github.com/metacollin/kicad-library.git /Library/Application\ Support/kicad
```

And you're done.  Everything will be the most recent version, in the right places, and will work as soon as you launch (or relaunch) KiCad.  

Updating is even simpler. To pull in any changes (and without overwriting your own additions):

```
git pull
git submodule update --remote --merge # This can take a couple of minutes to finish.
```


Enjoy!
