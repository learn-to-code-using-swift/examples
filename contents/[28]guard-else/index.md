---
title: "Guard-else"
description: ""
order: 28
---

We use guard-else to transfer program control out of scope when certain conditions are not met. Because of it, after a guard-else block, you must exit the scope:

```swift
func check(_ number: Int) {
    guard number > 0 else {
        print("Number is not positive")
        return
    }
    print("Number is positive")
}

check(-1)
```

Unlike if, which checks conditions and lets you continue inside its block, guard does the opposite: it checks for problems first, and if something's wrong, it exits early.

The expressions that can be used: 

- `break` (loops)
- `continue` (loops)
- `return` (functions)
- `throw` 
- `fatalError`

The guard statement pairs especially well with optionals. It lets you safely unwrap a value and exit early if the value is missing—leading to cleaner, more readable code.

```swift
guard let number = Int("6") else {
    fatalError("Ooops... this should always work, so we crash.")
}
print(number)
```

When calling a throwing function, you can use `try?` to convert errors into optional values. Then, you can use guard let to handle potential failure just like you would with any other optional.

```swift
func example() throws -> Int {
    return 10
}

guard let number = try? example() else {
    fatalError("invalid number")
}
print(number)
```

This pattern is simple, expressive, and avoids cluttering your code with do-catch blocks when you don't need full error handling.

