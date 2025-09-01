---
title: "Constants and variables"
description: ""
order: 2
---

A **constant** is a named container in memory that holds a value which cannot be changed after it is set. 

Constants are used to store information that remains the same throughout the program's execution. Because their values are fixed, constants are also referred to as immutable variables.

You can define a constant by using the `let` keyword. Then you choose the name you wish, finally assign the value of the constant after an equal `=` sign (assignment operator):

```swift
/// firstName is a constant, it can never change
let firstName = "Kitti"
```

If we try to assign another value to an existing constant, we get a compile-time error:

```swift
let firstName = "Kitti"

/// Cannot assign to value: 'firstName' is a 'let' constant
firstName = "Tibor"
```

A **variable** is a named container in memory that stores a value which can change during program execution.

The value of a variable can change. It is used to store and update information as needed. We also refer to variables as mutable variables.

You can define a variable using the `var` keyword:

```swift
/// We assign the value "Takács" to the lastName variable
var lastName = "Takács"
```

Since `lastName` is a variable, it's possible to change its value:

```swift
var lastName = "Takács"

/// we change the value of the lastName variable to "Bödecs"
lastName = "Bödecs"
```

Here's the complete example including a constant and a variable:

```swift
let firstName = "Kitti"
var lastName = "Takács"

lastName = "Bödecs"

/// print out the full name
print(firstName, lastName)
```

In the previous example, we declared only string constants and variables. Now, let's explore other common data types available in the Swift programming language.
