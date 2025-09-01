---
title: "The readLine function"
description: ""
order: 7
---

The `readLine()` function in Swift reads a line of input from the user as a string. Let's see a simple example: 

```swift
print("Please enter something:") 
let rawInput: String? = readLine() 

let input = rawInput ?? "" 
print("User input: `\(input)`") 
```

While `readLine()` is ideal for reading `String` values, you often need to convert user input to other types, such as integers, doubles, or booleans. To achieve this, use type casting or initializers to safely transform the input string into the desired type:

```swift
print("Please enter a number:")

let rawInput: String? = readLine()
let input = rawInput ?? ""

let number = Int(input) ?? 0
print("The number: `\(number)`")
```

For custom boolean input values, you typically use a comparison to decide whether something is `true` or `false`:

```swift
print("Please enter yes or no.")

let input: String = readLine() ?? ""

let value: Bool = input == "yes"
print("The bool value: \(value)")
```

In Swift, you can read multiple lines by simply calling `readLine()` more than once — each call will pause and wait for the user to type something and press Return. 


