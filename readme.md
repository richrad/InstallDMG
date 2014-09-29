A ruby script that takes a `.dmg`, moves any `.app` files it finds into your `/Applications` folder, unmounts the volume and then deletes the original file.

The accompanying Automator service can be used to launch the script from Launchbar. Open it and change the path to where you store the script. By default it looks in `~/Dropbox/bin/`.