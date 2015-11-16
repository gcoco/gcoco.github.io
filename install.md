# INSTALL MAC (the Homebrew way)

## Install XCode.

https://itunes.apple.com/us/app/xcode/id497799835

## Install Homebrew

http://brew.sh/

### Install git

`brew install git`

### Install QT5

`brew install qt5`

## Clone GoldenCheethah

`git clone https://github.com/GoldenCheetah/GoldenCheetah.git`

### Change into the GoldenCheetah directory

`cd GoldenCheetah`

### Copy required files

```
cp qwt/qwtconfig.pri.in qwt/qwtconfig.pri
cp src/gcconfig.pri.in src/gcconfig.pri
```

### Run qmake

`/usr/local/opt/qt5/bin/qmake -recursive`

### Compile GoldenCheetah

`make`
