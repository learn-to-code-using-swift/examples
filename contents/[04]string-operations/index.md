---
title: "String operations"
description: ""
order: 4
---

The plus sign (addition operator) works on `String` types to join multiple strings together. This is often called as string concatenation:

```swift
let firstName = "Kitti"
let lastName = "Bödecs"

let fulName = firstName + " " + lastName 
print(fulName)
```

Use the `\()` syntax to insert values into a String. Interpolation works with any data type, such as `Int` or `Double`.

```swift
var x = 12
var y = 6
let pi = 3.14
let name = "Kitti"

print("Hello, my name is \(name).")  
print("The coordinates are x: \(x) and y: \(y)")
print("Pi is always \(pi).")
```

Use triple quotes `"""` to define a string that spans multiple lines:

```swift
let lyrics = """
    You belong
    with me.
    """

print(lyrics)
```

When using multiline string literals, the closing triple quote `"""` must align with the start of the content. Whitespace is preserved exactly as written when using multiline strings.

You can check if a string is empty by using the `isEmpty` property. The `count` property returns the number of characters. It is also possible to turn a string into a lowercase or uppercase string:


```swift
let helloWorld = "Hello, World!"

print(helloWorld.isEmpty)
print(helloWorld.count)
print(helloWorld.uppercased())
print(helloWorld.lowercased())
```

To include double quotes (or other special characters) inside a string, use the backslash `\` to escape them:

```swift
let quote = "He said: \"Hello!\"."

print(quote)
```

If you prefer to avoid escape characters, you can use raw string literals. Raw strings are defined using the `#` symbol before and after the quotes, allowing you to include special characters like double quotes without needing to escape them:

```swift
let quote = #"He said: "Hello!"."#
print(quote)
```

You can also use string interpolation with raw strings. To do this, add a `#` after the backslash, like `\#(value)`, inside the raw string literal:

```swift
let name = "Kitti"
print(#"Hello, my name is \#(name)."#) 
```

You may use multiple `#` delimiter characters; if you do, you must use the corresponding number of characters when interpolating.

