---
title: "Defer"
description: "Schedule cleanup code to run when a scope exits, use multiple defer blocks, and handle loops, functions, and error cases."
order: 18
---

The `defer` keyword in Swift allows you to schedule code to run just before the current scope exits, regardless of how the scope is left (normal exit, return, or error). This is useful for cleanup tasks, such as closing files or releasing resources.

A `defer` block is executed in reverse order of appearance, after all other code in the scope has run.

Using `defer` in an `if` block:

```swift
let shouldProceed = true

if shouldProceed {
    defer {
        print("Exiting if block")
    }
    print("Inside if block")
}
```

You can use multiple `defer` statements within a switch case, and they will execute in reverse order when the scope exits. Here’s an example:

```swift
let value = 2

switch value {
case 1:
    defer {
        print("First defer in case 1")
    }
    defer {
        print("Second defer in case 1")
    }
    print("Inside case 1")
case 2:
    defer {
        print("First defer in case 2")
    }
    defer {
        print("Second defer in case 2")
    }
    print("Inside case 2")
default:
    defer {
        print("Default defer")
    }
    print("Default case")
}
```


You can also use `defer` within loops, such as a `for` loop, to ensure that specific code runs at the end of each iteration. Here’s an example of how to use `defer` in a loop:

```swift
for i in 1...3 {
    defer {
        print("Finished iteration \(i)")
    }
    print("Processing \(i)")
}
```

You can also use `defer` inside functions to ensure that cleanup code runs when the function exits, regardless of how it returns. This is especially useful for resource management, such as closing files or releasing memory.

Additionally, `defer` can be used in `guard-else` and `do-try-catch` blocks to handle cleanup when working with errors.
