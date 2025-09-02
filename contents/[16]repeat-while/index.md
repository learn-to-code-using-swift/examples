---
title: "Repeat-while"
description: ""
order: 16
---


The **repeat-while** loop is very similar to the while loop, but it always runs at least once. Even if the condition is false at the start, the body of the loop is executed first, and then the condition is evaluated. 

Here's the basic counter example using a repeat-while loop:


```swift
var counter = 1

repeat {
    print("Count is \(counter)")
    counter += 1
} 
while counter <= 5
```

The break keyword can be used inside a repeat-while loop to exit the loop early—before the condition becomes false:


```swift
var counter = 0

repeat {
    print("Counter: \(counter)")
    counter += 1

    if counter == 5 {
        print("Breaking the loop at counter = 5")
        break
    }
} 
while counter < 10
```

The continue statement also works with repeat-while loops in the same way it does with regular while loops. It allows you to skip the rest of the current iteration and move directly to the next cycle of the loop:

```swift
var number = 0

repeat {
    number += 1
    
    if number % 2 == 0 {
        continue // Skip even numbers
    }
    
    print("Odd number: \(number)")
} 
while number < 10
```

The snippet above is the repeat-while version of the "print odd numbers" example that we saw in the previous example. 