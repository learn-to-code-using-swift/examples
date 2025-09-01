---
title: "Standard types"
description: ""
order: 3
---


A `String` type is a sequence of characters used to represent text in programming. It can include letters, numbers, symbols, spaces — and even emojis.

```swift
let firstName: String = "Kitti"
var lastName = "Bödecs"

print(firstName, lastName)
```

A `Bool` (Boolean) data type represents two possible values: `true` or `false`. It's used to handle logical decisions in programming.

```swift
let isDeveloper: Bool = true
print(isDeveloper)

var isItMonday = false
print(isItMonday)
```

An `Int` type (short for integer) stores whole numbers, either positive or negative. It is also possible to perform mathematical operations by using Int types:

```swift
let x: Int = 12
let y = 3

print(x, y)
```

A `Double` data type is used to store numbers with decimal points, allowing for more precision than an `Int`. It is commonly used for calculations requiring fractional values.

```swift
let pi: Double = 3.14
print(pi)

let mph = 0.621371
print(mph)
```

Swift is smart enough to automatically figure out the type of a variable or constant without explicitly writing it. This is called _type inference_. 

Type inference works with `Bool`, `Int`, `Double` and `String` types.

Next, let's explore string operations in Swift.


