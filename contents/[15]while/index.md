---
title: "While"
description: "Repeat code while a condition is true, and control execution with break and continue to manage loop flow."
order: 15
---

Unlike some other loop types, a while loop is especially useful when you don't know in advance how many times the code should run, but you do have a condition that controls when to stop. As long as that condition holds true, the loop keeps working.

Let's look at a basic example: 

```swift
var counter = 1

while counter <= 5 {
    print("Count is \(counter)")
    counter += 1
}
```

Let's see how you can use the break statement to avoid unwanted infinite loops. We will modify the previous example by adding a line of code that allows the loop to exit once a certain condition is met:

```swift
var counter = 1

while true {
    print("Count is \(counter)")
    if counter == 5 {
        break
    }
    counter += 1
}
```

In Swift, the **continue** keyword is used inside loops to skip the current iteration and move directly to the next one. This is helpful when you want to _ignore certain values_ and still continue the loop:

```swift
var number = 0

while number < 10 {
    number += 1
    
    if number % 2 == 0 {
        continue // Skip even numbers
    }
    
    print("Odd number: \(number)")
}
```

In this example, we start with a variable called `number` set to `0`. As long as `number` is less than `10`, we increase its value by `1` in each loop iteration. If `number` can be divided by `2` with no remainder, it means the number is even, so the program uses the `continue` statement to skip printing and immediately returns to the beginning of the loop. This process repeats until `number` reaches `10`.

