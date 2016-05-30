#KiCad Library
### Convenience edition

This is the complete package.  Every component library, every footprint library, and every 3D model and other extras that are contained in the official [KiCad repositories](https://github.com/kicad), but in one aggregate repository.  Finally, getting a complete and ready-to-go KiCad environment, as well as keeping everything update, is ony slightly more painful than it ought to be!

This repository is not a mirror, but a repository of repositories, so cloning it will grab **the most up-to-date versions of all of the official support files**, no matter what.  The official repo list is also scraped every hour to check for new repositories that might have been added.  And, if needed, new repos are automatically added to this one, and the fp-lib-table file regenerated to reflect the additions.

Note: this sets up the footprint libraries as local ones, not using the github plugin.  This is a fair bit faster, and gives you more control, but the trade off is you must manually update your local copies (which is easy to do, thankfully!).

### How to use this repository 
##### (if you just git clone this, it will not work!)

This is meant to be cloned directly into the kicad library directory.  You may need to move the `$(prefix)/share/kicad` directory out of the way.

On Windows and Linux:
```
# Note: `$(prefix)` is your KiCad install path.
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
