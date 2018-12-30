# MyUbuntuSounds

myalert.sh is a script used to change the Ubuntu's default system sounds to your own choices.

Current sounds that can be changed:
* The startup sound
* The terminal bell sound. (triggered in failed backspace or autocomplete)

## Getting Ready
Clone this repository on your machine using:
```
git clone https://github.com/EvangelouSotiris/myUbuntuSounds
```
Then, inside the directory, to make myalert.sh executable run:
```
chmod +x myalert.sh
```

## Prerequisites
* ffmpeg (most likely is already installed.)
* ability to use sudo in your machine. (So that your sound is moved into the root dirs)

## Running myalert.sh
Usage pattern:
```
./myalert.sh set [FULLPATH] --[OPTION]
```
FULLPATH = full path to the sound file you want to set as a system sound
OPTION = the type of system sound. Use 'startup' to switch the startup sound and 'terminalbell' to change the terminal's bell sound.

After the changes, reboot your system to apply them.

##Author
**Evangelou Sotiris** - *Developer* - [Github](https://github.com/EvangelouSotiris)
