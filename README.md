# BorderedButton
UI Button subclass that imitates buttons in the App Store app.

<img src="https://raw.githubusercontent.com/daniel-barros/BorderedButton/assets/video.gif" width="200px" height="120px" />

## Installation

### CocoaPods

Install [CocoaPods](http://cocoapods.org) with the following command:

```bash
$ gem install cocoapods
```

Go to your project directory and create a `Podfile` with:

```bash
$ pod init
```

Add these lines to your `Podfile`:

```ruby
use_frameworks!

target '<Your Target Name>' do
    pod 'BorderedButton'
end
```

Finally, run the following command:

```bash
$ pod install
```

### Manually

Drag the whole project into your workspace, build it, and add the framework to the Embedded Binaries of your project.
