# AudioKit Mic Input
Swift Xcode Project that demonstrates how to set up a microphone input via AudioKit verions 5. Be sure to plug in headphones in order to avoid a feedback loop.

## Installation  

### In Xcode 13:

To add AudioKit to your Xcode project

1. Select File -> Add Packages...
2. Enter `https://github.com/AudioKit/AudioKit` for the URL, into the search input field in the top right.
3. When the AudioKit package appears, click on the "Add Package" button.
4. When the dialogue box appears, saying "Choose Package Products for AudioKit," you can define which version range you want, or which branch to use, or even which exact commit you would like use. If you only have one package, it will be checked by default.
5. Click on the "Add Package" button to complete the download of the AudioKit Swift Package.

### In Xcode 11 & 12:

To add AudioKit to your Xcode project

1. Select File -> Swift Packages -> Add Package Depedency. 
2. Enter `https://github.com/AudioKit/AudioKit` for the URL.  You can define which version range you want, or which branch to use, or even which exact commit you would like use. 

## Documentation

All AudioKit documentation is generated from this repository. The documentation that appear in the `docs` folder generate the [AudioKit.io Web Site](https://audiokit.io/).  API documentation appears on the [Github wiki](https://github.com/AudioKit/AudioKit/wiki).
