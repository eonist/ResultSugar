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
