![Lang](https://img.shields.io/badge/Language-Swift-orange.svg)
![mit](https://img.shields.io/badge/License-MIT-brightgreen.svg)
[![SwiftLint Sindre](https://img.shields.io/badge/SwiftLint-Sindre-hotpink.svg)](https://github.com/sindresorhus/swiftlint-sindre)
[![codebeat badge](https://codebeat.co/badges/cb649e6d-a601-47c5-b2c4-179158d5f431)](https://codebeat.co/projects/github-com-eonist-resultsugar-master)

# ResultSugar
Sugar for Result

### Install:
- Carthage ` "https://github.com/eonist/ResultSugar.git" branch: "master"`
- Manual Open `.xcodeproj`

### Examples:
```swift
guard let imageAndURL: (UIImage, URL) = $0.value else { return }
imageAndURL.image // UIImage
imageAndURL.url // URL
print($0.errorStr)
```
