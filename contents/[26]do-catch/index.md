---
title: "Do-catch"
description: "Handle errors safely using do, multiple catch blocks, and fallback handling to manage different error types gracefully."
order: 26
---

Effective error handling begins by defining an enum or struct to represent all possible error cases your code might encounter:

```swift
enum InputError: Error {
    case invalidNumber
}

print("Please enter a number:")
let rawInput = readLine() ?? ""

if let numberInput = Int(rawInput) {
    print(numberInput)
}
else {
    throw InputError.invalidNumber
}
```

Because the thrown error is not caught or handled, Swift does not know how to proceed and the program immediately crashes with a runtime error. To avoid that crash, we need to wrap the throwing code inside a do-catch block, where we can decide what to do when that specific error happens:

```swift
enum InputError: Error {
    case invalidNumber
}

enum MathError: Error {
    case divisionByZero
}

do {
    print("Please enter a number:")
    let rawA = readLine() ?? ""

    if let a = Int(rawA) {
        
        print("Please enter a second number:")
        let rawB = readLine() ?? ""
        
        if let b = Int(rawB) {
            
            if b == 0 {
                throw MathError.divisionByZero
            }
            else {
                print(a/b)
            }
        }
        else {
            throw InputError.invalidNumber
        }
    }
    else {
        throw InputError.invalidNumber
    }
}
catch is InputError {
    print("Input error.")
}
catch let error as MathError {
    switch error {
    case .divisionByZero:
        print("Division by zero is not possible.")
    }
}
catch {
    print(error)
}
```

In this example, both `InputError` and `MathError` are explicitly handled using separate catch blocks. The final catch block serves as a fallback, capturing any errors that do not match the previous cases.

