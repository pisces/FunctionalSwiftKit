# FunctionalSwiftKit

[![CI Status](https://img.shields.io/travis/pisces/FunctionalSwiftKit.svg?style=flat)](https://travis-ci.org/pisces/FunctionalSwiftKit)
[![Version](https://img.shields.io/cocoapods/v/FunctionalSwiftKit.svg?style=flat)](https://cocoapods.org/pods/FunctionalSwiftKit)
[![License](https://img.shields.io/cocoapods/l/FunctionalSwiftKit.svg?style=flat)](https://cocoapods.org/pods/FunctionalSwiftKit)
[![Platform](https://img.shields.io/cocoapods/p/FunctionalSwiftKit.svg?style=flat)](https://cocoapods.org/pods/FunctionalSwiftKit)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Using

### Condition
 * You can use this instead of condition statement according to functional programming paradigm.
 * Ensures thread safety.
 * It is simple.
 * Global variable.

#### Using single condition statement
```swift
if <<true or false>> {
  // if statement
} else {
  // else statement
}
```
```swift
condition
  .can(<<true or false>>) {  
    // write to code for if statement
  }.not {
    // write to code for else statement
  }
```

#### Using multiple condition statements
```swift
if <<true or false>> {
  // first if statement

  if <<true or false>> {
    // second if statement
  } else {
    // second else statement
  }
} else {
  // first else statement
}
```
```swift
condition
  .can(<<true or false>>) {  
    // write to code for first if statement
  }
  .not {
    // write to code for first else statement
  }
  .also(<<true or false>>) {
    // write to code for second if statement
  }.not {
    // write to code for second else statement
  }
```

#### Using multiple condition statements each
```swift
if <<true or false>> {
  // first if statement
} else {
  // first else statement
}

if <<true or false>> {
  // second if statement
} else {
  // second else statement
}
```
```swift
condition
  .can(<<true or false>>) {  
    // write to code for new if statement
  }
  .not {
    // write to code for new if statement
  }
  .can(<<true or false>>) {
    // write to code for new else statement
  }.not {
    // write to code for new else statement
  }
```

### Array extension
 * Here are some frequently used functions with array.

```swift
// Sample struct
struct Model: Hashable {
    let uid: String
    var hashValue: Int { return uid.hashValue }

    static func ==(lhs: Model, rhs: Model) -> Bool {
        return lhs.uid == rhs.uid
    }
}
```

#### Using function 'grouped' with strings
```swift
let source = ["A", "A", "B", "C"]
let grouped = source.grouped { $0 }
// print -> ["A": ["A", "A"], "B": ["B"], "C": ["C"]]
```

#### Using function 'grouped' with structs
```swift
let source = [Model(uid: "A"), Model(uid: "A"), Model(uid: "B"), Model(uid: "C")]
let grouped = source.grouped { $0.uid }
// print -> ["A": [Model(uid: "A"), Model(uid: "A")], "B": [Model(uid: "B")], "C": [Model(uid: "C")]]
```

#### Using function 'subtracted'
```swift
let source = [Model(uid: "A"), Model(uid: "B")]
let other = [Model(uid: "A")]
let subtracted = source.subtracted(other)
// print -> [Model(uid: "B")]
```

#### Using function 'uniqued'
```swift
let source = [Model(uid: "A"), Model(uid: "A"), Model(uid: "B"), Model(uid: "B")]
let uniqued = source.uniqued()
// print -> [Model(uid: "A"), Model(uid: "B"), Model(uid: "C")]
```

### Optional extension
 * You can use unwrap of Optional instead of map when you don't need return element.

```swift
import FunctionalSwiftKit

func testUnwrap() {
    let string: String? = "string"
    string.unwrap { <<your function for execution>>($0) }
}
```

## Requirements
iOS Deployment Target 9.0 higher

## Installation

FunctionalSwiftKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'FunctionalSwiftKit'
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate FunctionalSwiftKit into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "pisces/FunctionalSwiftKit"
```

Run `carthage update` to build the framework and drag the built `FunctionalSwiftKit.framework` into your Xcode project.

## Author

Steve Kim, hh963103@gmail.com

## License

FunctionalSwiftKit is available under the BSD 2-Clause License license. See the LICENSE file for more info.
