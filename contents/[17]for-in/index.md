---
title: "For-in"
description: "Iterate over strings, arrays, ranges, and dictionaries. Use continue, break, .enumerated(), and stride."
order: 17
---

The for-in loop is different from while and repeat-while loops because it is typically used when you know exactly how many times you want to repeat an action, or when you want to go through each item in a collection.

You can use a for-in loop to iterate through the characters of a string:

```swift
let text = "Hello"

for character in text {
    print(character)
}
```

It's very common to use for-in loops with arrays:

```swift
// for-in
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}
```

You can use a for-in loop to repeat some code for each value in a range:

```swift
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
```

Another example, that mimics the behavior of a clock using ranges: 

```swift
let minutes = 60
for minute in 0..<minutes {
    print("Tick - \(minute)")
}
```

You can also iterate over a Dictionary to access its key-value pairs. Each item in the dictionary is returned as a (key, value) tuple when the dictionary is iterated, and you can decompose the (key, value) tuple's members as explicitly named constants for use within the body of the for-in loop:

```swift
let numberOfLegs = [
    "spider": 8, 
    "ant": 6, 
    "cat": 4
]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}
```

The continue keyword works just as you might expect. It lets you skip the rest of the current loop iteration and immediately move on to the next cycle of the loop:

```swift
for value in 0..<60 {
    if value % 2 == 0 {
        continue    
    }
    print(value) 
}
```

The break keyword works the same way as it does in other types of loops. It will immediately stop the entire loop when it is called, ending the current cycle and exiting the loop:

```swift
for value in 0..<60 {
    if value == 42 {
        print("The meaning of life is \(value).")
        break
    }
    print("Skipping \(value)...")
}
```

Here's how you can use `.enumerated()` in a for-in loop:

```swift
let colors = ["Red", "Green", "Blue"]

for (index, color) in colors.enumerated() {
    print("Color \(index): \(color)")
}
```
The **stride** function lets you set your own step size, such as counting by every 2 numbers or every 5 seconds. Each time the loop runs, the value increases by the step amount you choose:

```swift
for value in stride(from: 0, to: 60, by: 5) {
    print(value) // 0, 5, 10, 15 ... 45, 50, 55)
}
```

It's also possible to save the sequence in a constant, before using it:

```swift
let sequence = stride(
    from: 0,
    to: 60,
    by: 5
)

for value in sequence {
    print(value) // 0, 5, 10, 15 ... 45, 50, 55)
}

// cast the sequence to an array
let array = Array(sequence)
print(array)
```

The stride function creates a sequence that starts from a specific value and goes up to, but does not include, the end value. 

This sequence — created by the stride function — can only be iterated over using a for loop, but if you want to perform other operations on it, you can convert it to an array by type-casting.
