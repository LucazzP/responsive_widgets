## 1.0.2
- Fixed to run only with context as argument to init.

## 1.0.1
- Added support for Tablet, horizontal mode, and for web.
- To works the new functionalities is necessary to use `ResponsiveWidgets.builder(child: )`, to recalculate the proportion
every time the sizes of device changes. Inclusive when the device turned to left/right...
- `ResponsiveWidgets().init(context)` changed to `ResponsiveWidgets.init(context)`
- Changed type of Flutter project from plugin to package.

(Breaking changes)

## 0.1.10
- Added assert if the plugin is used without init

## 0.1.9
- Changed to static methods on main class

## 0.1.8
- Keys is now Working
- Classes code reformated

## 0.1.7
- Updated Kotlin and Gradle

## 0.1.6
- Updated packages

## 0.1.5
- Ios fixed.

## 0.1.4
- Readme updated.
- Repository url fixed.

## 0.1.3
- Readme updated.

## 0.1.2
- Readme updated.
- Changed getSizeByDp() to getSize().

## 0.1.1
- Changed description.

## 0.1.0
- This plugin helps to create responsive widgets, that makes a auto-size with the proportion between reference Screen Size and the screen that the app is running. The package only changed the original widgets, like "Container" to apply a function that make this calculation.