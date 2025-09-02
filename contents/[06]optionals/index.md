---
title: "Optionals"
description: "Understand nil, optional types, force unwrapping, implicitly unwrapped optionals, and the nil coalescing operator."
order: 6
---

An optional in Swift is a type that can either hold a value or have no value (no value is represented as `nil`). An optional always has an underlying data type, such as `String`, `Int`, `Double`, etc. 

An optional value is indicated by the `?` symbol, like this:

```swift
var myOptionalStringVariable: String? 

print(myOptionalStringVariable)

// Warning: Expression implicitly coerced from 'String?' to 'Any'
```

If you define an optional variable, Swift automatically gives it a value of `nil` if you don't set one yourself. To fix the warning, provide a default value using the nil coalescing operator `??`:

```swift
var userName: String? = "Kitti"
print(userName ?? "")

userName = nil
print(userName ?? "")
```

Sometimes, when you try to convert one type into another, the operation might fail. Swift is built to handle this uncertainty safely — instead of crashing your program, it gives you back an optional, which either contains a value or is `nil`:

```swift
let str = "5"
let num = Int(str)

print(num) 
```

Swift gives you the option to force unwrap the optional — which means telling Swift, "I know there's a value here, go ahead and use it." You can force unwrap an optional value by writing `!` after it, like this:

```swift
let str = "3.14"
let num = Double(str)!

print(num)
```

An implicitly unwrapped optional – written as `String!` – may also contain a value or be `nil`, but they don't need to be checked before they are used:

```swift
var x: Int! = 10
print(x)

x = nil

let unwrappedX: Int = x // Fatal error
print(unwrappedX)
```

Just like in the case of force unwrapping, if you try to use a value that contains nil your code will crash.

