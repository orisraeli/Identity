# Identity
![release](https://img.shields.io/github/release/orisraeli/identity.svg) ![platform](https://img.shields.io/badge/Swift-5.0-orange.svg ) ![license](https://img.shields.io/github/license/orisraeli/identity.svg)  ![contact](https://img.shields.io/badge/Contact-orisraeli.com-blue.svg)

Identity is a small app with an algorithm which checks whether an Israeli ID number is valid.

The validation is offline and we do not store your information and never connect or send it to the internet.

If you're interested in finding out how the algorithm works you can check this article (hebrew) [halemo](http://halemo.net/info/idcard/).

Originally written in Swift 3, updated for Swift 4 and 5. Compatible with iOS 11.0+.

## Screenshot
![screenshot](https://raw.github.com/orisraeli/Identity/master/screenshot_identity_v2.png)

## Changelog
Release v2 has a lot of new features:
- New name: Identity (originally called ValidateID) and a new icon.
- New prettier UI. This app now uses programmatic UI and constraints instead of Storyboard.
- Validation algorithm enhancements.
- App flow refactoring and enhancements.

## Installing and Testing
To install simply clone/download the repository and open with Xcode.
You can use this dummy Israeli ID number for testing purposes: 789621349.

You can check the main source code file here: [IdentityViewController.swift](/Identity/Identity/IdentityViewController.swift).

Feel free to pull request, create a new issue or contact me with any questions or suggestions. I'll be happy to help. 
