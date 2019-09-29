![Lang](https://img.shields.io/badge/Language-Swift-orange.svg)
![mit](https://img.shields.io/badge/License-MIT-brightgreen.svg)
[![SwiftLint Sindre](https://img.shields.io/badge/SwiftLint-Sindre-hotpink.svg)](https://github.com/sindresorhus/swiftlint-sindre)
[![codebeat badge](https://codebeat.co/badges/cb649e6d-a601-47c5-b2c4-179158d5f431)](https://codebeat.co/projects/github-com-eonist-resultsugar-master)
![Builds](https://github.com/eonist/ResultSugar/workflows/Builds/badge.svg)

# ResultSugar
Sugar for Result

### Install:
- Carthage ` .url("https://github.com/eonist/ResultSugar.git"), .branch("master")`
- Manual Open `.xcodeproj`

### Example:
```swift
typealias OnComplete = (Result<String, Error>) -> Void
ResultSugarTests.assert(flag: true) { result in
   guard let msg: String = result.value() else { Swift.print("\(result.errorStr)"); return }
   Swift.print("\(msg)") // Works 👌
}
static func assert(flag: Bool, complete: OnComplete) {
  if flag {
     complete(.success("Works 👌"))
  } else {
     complete(.failure(NSError("Doesn't work 🚫")))
  }
}
```

### Todo: 
- Make more succinct example
- Make more examples
