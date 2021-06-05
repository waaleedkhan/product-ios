
# **Products**

**Tech Stack**
================

- Native iOS project for iPads.
- Built using Swift 5 and `Xcode 12.4`.
- Minimum supported OS version is 13.0+

**Setup Process**
================
### Pre-requisites:
1. Latest MacOS
2. Latest Xcode
3. Latest version of [cocoa pods](https://cocoapods.org)

**Code Structure**
=================

**1. AppDelegate**
Contains the AppDelegate and it's extension. AppDelegate is the main entry point of an iOS application.

**2. Cells**
Contains the TableViewCells that are used in the App.

**3. Components**
Contains generic components that are used throughout the App, such as; TableView, CollectionView etc.

**4. Constants**
Constants file.

**6. Models**
Contains Entities used in the App. API responses are parsed into an Entity object.

**7. Enums**
Contains Enums used in the App.

**8. Extensions**
Extensions made to existing generic Swift Classes have been placed here.

**11. Protocols**
Contains Protocols used in the App.

**12. Resources**
Contains the Images, Fonts and Launch Screen (splash screen).

**13. Scenes**
Contains the screens of the App. All controllers and views used have been inherited from BaseController and BaseView.

**14. Services**
Contains the Service implementation. HTTPServices contains all the API requests made from the App.

**17. Utils**
Contains Utility classes used within the App.

## Third party dependencies:
- [SwiftLint](https://github.com/realm/SwiftLint) 0.42.2
    - for static code analysis

## Known Issues

- Pagination information was missing from the API response. Hence Pagination is not implemented.
- Error Handling Protocol `ErrorConvertible` is created. But due to lack of Time, It was not implemented.
