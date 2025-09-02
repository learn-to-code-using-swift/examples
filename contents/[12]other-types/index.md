---
title: "Other types"
description: ""
order: 12
---

The `Character` type represents a single, human-readable symbol: letter, digit, punctuation, or emoji. Swift is fully Unicode-compliant.

```swift
let c1: Character = "a"
let c2: Character = "ű"
let c3: Character = "🤔"
```

Use escape characters to embed special symbols or control formatting inside string literals:

```swift
print("Backslash: \\")            // \
print("Single quote: \'")         // '
print("Double quote: \"")         // "
print("Newline:\nNext line")      // newline
print("Tab:\tIndented")           // tab
print("Carriage\rReturn")         // carriage return
print("Null:\0After null")        // includes a null byte
print("Unicode heart: \u{1F496}") // 💖
```

The `print()` function accepts two handy parameters:

```swift
print(
    "Milk", "Eggs", "Bread", "Butter", 
    separator: ", ", 
    terminator: "."
)
```

The `Int` type is the general-purpose whole-number type, but Swift also provides fixed-width integer types for tighter control over size and range:

- Signed: `Int8`, `Int16`, `Int32`, `Int64`, `Int128`
- Unsigned: `UInt8`, `UInt16`, `UInt32`, `UInt64`, `UInt128`

Use `.min` and `.max` to inspect their ranges:

```swift
print(UInt8.min) 
print(Int128.max)
```

The `Float` and `Double` types can store floating-point numbers. `Double` is the default and offers higher precision:

```swift
let d: Double = 3.141592653589793
let f: Float  = 3.141592653589793

print(d) // 15 significant digits
print(f) // 7 significant digits
```
The `Any` type is a flexible container that can store a value of any type. Before using the value, safely cast it to a specific type with `as?` to avoid runtime errors:

```swift
var value: Any = "Hello"

let s = value as? String ?? "unknown"
print("String:", s)

let items: [Any] = [42, "Swift", true]

let i = items[0] as? Int ?? -1
let t = items[1] as? String ?? "unknown"
let b = items[2] as? Bool ?? false

print(i, t, b)
```

The `tuple` type allows you to combine several values into a single, compound value. Tuples are lightweight, fixed in size, and can hold values of different types:

```swift
let product = ("MacBook", 1099.99)
print(product.0)
print(product.1)

var colored = ("MacBook", 1099.99, "Desert sand")
colored.1 = 1299.99

let named = (product: "Learn Swift App", version: 2.1)
print(named.product)
print(named.version)

let (name, price) = product
print(name, price)
```

Tuple values can be named or unnamed. You can access their elements using dot syntax, either by index (e.g., `.0`, `.1`) or by name (e.g., `.product`, `.version`). 

Use tuples for grouping related data without creating a custom type.
