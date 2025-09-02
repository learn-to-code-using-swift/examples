---
title: "If-else"
description: "Write conditions using if, else if, and else, combine logic with operators, use ternary expressions, and optional binding."
order: 13
---

An `if` statement evaluates a condition and runs code only if that condition is `true`. If the condition is `false`, Swift skips that code.

```swift
let score = 95

if score > 50 {
    print("You've passed the exam.")
}
```

An `else` clause handles situations when the condition is `false`. One of the two branches always runs:

```swift
let score = 25

if score > 50 {
    print("You've passed the exam.")
}
else {
    print("You've failed the exam.")
}
```

The `else if` block lets you chain multiple conditions together:

```swift
let score = 78

if score >= 90 {
    print("Grade: A - Excellent work!")
}
else if score >= 80 {
    print("Grade: B - Great job!")
} 
else if score >= 70 {
    print("Grade: C - Good effort!")
} 
else if score >= 60 {
    print("Grade: D - Needs improvement.")
} 
else {
    print("Grade: F - You failed.")
}
```

Evaluation happens top-down. The first matching condition runs and the rest are skipped. The final `else` clause is optional.

Swift supports logical operators to combine conditions:

```swift
let score = 72
let extraCredit = true

if score >= 70 || (score >= 65 && extraCredit) {
    print("You passed the class.")
} 
else {
    print("You failed the class.")
}
```

Using ranges can simplify comparisons:

```swift
let score = 85

if (90...).contains(score) {
    print("Grade: A")
}
else if (80..<90).contains(score) {
    print("Grade: B")
}
else {
    print("Below B")
}
```

Conditions can be nested for more specific checks:

```swift
let score = 92
let attendance = 85

if score >= 90 {
    if attendance >= 80 {
        print("Excellent attendance and performance!")
    } 
    else {
        print("Great performance, but attendance needs improvement.")
    }
} 
else {
    print("Keep working to improve your grade.")
}
```


In Swift, `if-else` statements are expressions, so you can assign a variable directly based on the result:

```swift
let score = 75

let feedback = if score >= 90 {
    "Excellent work! You got an A."
} 
else if score >= 80 {
    "Great job! You earned a B."
} 
else if score >= 70 {
    "Good effort! You achieved a C."
} 
else if score >= 60 {
    "Needs improvement. You got a D."
} 
else {
    "You failed. Better luck next time."
}
print(feedback)
```

All branches must return the same type. An `else` branch is required.

For simple conditional assignments, Swift provides a shorthand known as the ternary conditional operator. It allows you to choose between two values based on a condition:

```swift
let score = 75
let result = score >= 60 ? "Pass" : "Fail"
```

Ternary operators can also be chained:

```swift
let grade = score >= 90 ? "A" :
            score >= 80 ? "B" :
            score >= 70 ? "C" :
            score >= 60 ? "D" : "F"
```


Optional binding is a technique in Swift that allows you to safely check if an optional contains a value, and if so, assign that value to a temporary constant or variable for use within a specific scope:

```swift
let rawInput: String? = "Alice"

if let unwrappedInput = rawInput {
    print("Hello, \(unwrappedInput)")
} 
else {
    print("Name is nil.")
}
```

Short form:

```swift
let input: Int? = 10
if let input {
    print(input)
}
```

Multiple optionals can be unwrapped at once:

```swift
let x: Int? = 10
let y: Int? = 5

if let x, let y {
    print("Sum: \(x + y)")
}
else {
    print("x or y is missing.")
}
```

Optional binding also works inside expressions:

```swift
let customLabel: String? = nil
let buttonText = if let customLabel {
    customLabel
} else {
    "Submit"
}
```

Equivalent using the nil-coalescing operator:

```swift
let buttonText = customLabel ?? "Submit"
```

Optional binding is a fundamental Swift pattern for working with values that may be missing.

