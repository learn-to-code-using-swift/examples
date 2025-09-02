---
title: "Closures"
description: "Define and use closures with parameters, return values, shorthand syntax, trailing closures, and operators as functions."
order: 20
---

A closure in Swift is a block of code that you can store in a variable, pass around in your program, and run whenever you need. You can think of closures as function-like values — they work very much like functions, but they do not always need a name.

```swift
let greet = {
    print("Hello, world")
}
greet()
```

Closures can also have parameters. You also need to define the type of the parameters, just like you'd do when defining the parameters of a function. The syntax is just slightly different:

```swift
let greet = { (name: String) in
    print("Hello, \(name)")
}

greet("Tibi")
```

Closures can also return values:

```swift
let sum = { (num1: Int, num2: Int) -> Int in
    return num1 + num2
}

let res = sum(2, 3)
print(res) // 5
```

Here is an example of a function and a closure, both performing the same task:

```swift
func sum(num1: Int, num2: Int) -> Int {
    number + number
}

let add = { (num1: Int, num2: Int) -> Int in
    num1 + num2
}
```

It is possible to move out the closure type information from the definition and explicitly tell the type of the `add` constant instead. The following example is the exact same as the previous one, but we've moved the type information to the left:

```swift
let add: ((Int, Int) -> Int)  = { num1, num2 in
    num1 + num2
}
```

If you have a function with the same signature (exact same parameter types and return types), you can use that function as a closure:

```swift
func add(a: Int, b: Int) -> Int {
    a + b
}

let sum: (Int, Int) -> Int = add
sum(2, 3) // 5
```

By assigning a function to a variable like sum, you _treat behavior_ as _data_. This means you can change what sum actually does at runtime:

```swift
func add(a: Int, b: Int) -> Int { a + b }
func multiply(a: Int, b: Int) -> Int { a * b }

var operation: (Int, Int) -> Int = add
print(operation(3, 4))

operation = multiply
print(operation(3, 4))
```

By the way, in Swift, every identifier must be unique within its scope. That means you can't define a variable and a function with the same name in the same place—Swift won't know which one you mean. You get a compiler error.


A function parameter can be a closure, in the example below it takes two integers and returns an integer after performing a specific operation on them:

```swift
func performOperation(
    _ a: Int,
    _ b: Int,
    _ op: ((Int, Int) -> Int)
) {
    print(op(a, b))
}

performOperation(3, 1, { a, b in a + b })
performOperation(3, 1, { a, b in a - b })
```

Once you feel more comfortable with closures, you can switch to writing shorter, more concise versions that are easier to read and maintain. Here are some examples to show how you can make closures more concise as you get comfortable with the syntax:

```swift
// longest form, explicit types and return keyword
performOperation(3, 1, { (a: Int, b: Int) -> Int in return a + b }) 
// no explicit types
performOperation(3, 1, { a, b in return a + b }) 
// no explicit return keyword
performOperation(3, 1, { a, b in a + b }) 
// most simple, shorthand argument names called "trailing closure syntax: 
performOperation(3, 2, { $0 * $1 }) 
```

When a function's last parameter is a closure, you can use trailing closure syntax to make the function call simpler and easier to read:

```swift
performOperation(3, 2) { $0 * $1 } // 6
```

You can also use multiple trailing closure syntax when a function has more than one closure parameter:

```swift
func getPointFromClosures(
  x: () -> Int,
  y: () -> Int
) -> (x: Int, y: Int) {
  (x(), y())
}

let point = getPointFromClosures { 42 } y: { 69 }

print(point.x, point.y)
```

Because operators are also functions in Swift, you can use them as closure parameters just like you would with regular functions:

```swift
func mul(_ a: Int, b: Int) -> Int {
    a * b
}
performOperation(3, 2, mul)

performOperation(3, 2, +)
performOperation(3, 2, *)
```

By using operators as closure parameters, your Swift code can become simpler and easier to follow, especially in cases where you want to perform standard operations in a flexible way.

