---
title: "Runtime checks"
description: ""
order: 30
---

An assertion is basically a check if a condition is true. If it's false, the program crashes in Debug mode with an optional message. In Release mode, `assert` is completely ignored.

Use it when you want to double-check assumptions during development and when you want to catch mistakes early without affecting Release builds:


```swift
let age = -1

assert(age >= 0, "Age can't be negative!")  
```

If you don't have a condition to check but want to indicate a serious failure, you can also use:

```swift
assertionFailure("This should never happen")
```

Use `precondition` when violating a rule should never be allowed — not even in production. Unlike `assert`, `precondition` stays active even in Release mode. If the condition is false, your program crashes.

Let's say you must never receive a negative value — it would lead to incorrect results or corrupted state. You want to stop execution even in Release mode:

```swift
let number = -10

precondition(number >= 0, "Only positive numbers allowed")  
```

If this ever fails, it's a serious bug—your program should not continue running. Just like with `assert`, there is also:

```swift
preconditionFailure("Unreachable code")
```

The `fatalError` function doesn't check a condition—it simply crashes the program immediately with a message. It's always active, in both Debug and Release mode.

Use it when a feature is not yet implemented, like here:

```swift
func convertToJSON() -> String {
    fatalError("This function hasn't been written yet")
}
```

Using `fatalError` here makes your intent crystal clear. Anyone reading your code will instantly see that the function is incomplete on purpose.
