---
title: "Switch-case"
description: "Match values, use default cases, fallthrough, intervals, tuples, pattern matching, and value binding in switch statements."
order: 14
---


The switch statement executes the code for the first case that matches the value, just like the if statement does when a condition is true. Swift's switch statement is exhaustive—every possible value must be handled, either by listing each one explicitly or by including a default case:

```swift
let day = "Monday"

switch day {
case "Monday":
    print("Start the work week.")
case "Saturday":
    print("Relax, it's the weekend!")
case "Sunday":
    print("Prepare for the week ahead.")
default:
    print("It's a regular weekday.")
}
```

If the cases are exhaustive, the default case is optional:

```swift
let isCompleted = true

switch isCompleted {
case true:
    print("Task is ready.")
case false:
    print("Task is not completed.")
}
```

Sometimes, different values should be handled in the same way. You can group multiple values into a single case by listing them and separating each one with a comma:

```swift
let someCharacter: Character = "E"

switch someCharacter.lowercased() {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
    "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) isn't a vowel or a consonant")
}
```

It is also possible to use a switch-case to conditionally set values, using the assignment operator, just like you have seen it with if-else. Extract and use values from the matched data like here:


```swift
let anotherCharacter: Character = "a"

let message = switch anotherCharacter {
case "a":
    "The first letter of the Latin alphabet"
case "z":
    "The last letter of the Latin alphabet"
default:
    "Some other character"
}

print(message)
```

Break can be used to match and ignore one or more cases in a switch statement.  It causes the switch statement to end its execution immediately:

```swift
print("Loading website...")

let statusCode = 404

switch statusCode {
case 200:
    break
case 404:
    print("Not found")
default:
    print("Unknown status code")
}

print("Done.")
```

The **fallthrough** keyword, on the other hand, tells Swift to continue execution to the next case, even if there was already a match:

```swift
let weather = "warm"

switch weather {
case "cold":
    print("It's a cold day.")
case "warm":
    print("It's a warm day.")
    fallthrough
case "sunny":
    print("It must be sunny too.")
default:
    break
}
```

Interval matching in a switch statement works much like checking ranges using an if statement, but the syntax is different and usually easier to read:

```swift
let grade = 95

switch grade {
case 90...100:
    print("Excellent! You got an A.")
case 80...89:
    print("Good job! You got a B.")
case 70...79:
    print("Keep it up! You got a C.")
case 60...69:
    print("You passed with a D.")
default:
    print("You need to improve. You got an F.")
}
```

Switch statements in Swift support pattern matching, which means you can match values not only with intervals, but also with tuples, value bindings, and even more complex patterns:

```swift
let first: Bool = true
let second: Bool = false

switch (first, second) {
case (true, true):
    print("Both true")
case (true, false):
    print("First true")
case (false, true):
    print("Second true")
case (false, false):
    print("Both false")
}
```

You can also ignore values (match any value) by using an underscore character:

```swift
let point = (0, 0)

switch point {
case (0, 0):
    print("Origin")
case (_, 0):
    print("On the X-axis")
case (0, _):
    print("On the Y-axis")
default:
    print("Somewhere else")
} 
```

You can capture the values that match a pattern using value binding, allowing you to use those values directly within the case block:

```swift
let point = (2, 3)

switch point {
case (let x, 0):
    print("On the X-axis at x = \(x)")
case (0, let y):
    print("On the Y-axis at y = \(y)")
case let (x, y):
    print("At some other point: (\(x), \(y))")
}
```

This approach gives you direct access to the data while also matching its structure. It's a powerful feature of Swift's switch statement.


