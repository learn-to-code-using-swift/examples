---
title: "Throwing functions"
description: "Mark functions with throws, handle errors using try, do-catch, try?, try!, and use rethrows with throwing closures."
order: 27
---

In Swift, functions that can throw errors are explicitly marked with the throws keyword. This is the language's way of making error-prone operations visible and intentional.

```swift
enum PrinterError: Error {
    case outOfPaper
}

func printDocument() throws {
    throw PrinterError.outOfPaper
}
```

You can be explicit about what kind of error a function throws by writing the type in parentheses:

```swift
func printDocument() throws(PrinterError) {
    throw PrinterError.outOfPaper
}
```

Calling a throwing function is different from calling a regular function. You need to use the `try` keyword to tell the Swift compiler: "I know this might fail, and I'll handle it." You always have to use `try` whether the function throws any error or a specific error type:

```swift
do {
    try printDocument()
    print("Printed successfully.")
} 
catch {
    print("Printing failed: \(error)")
}
```

Let's go a bit deeper. First, we define a custom error:

```swift
struct InputError: Error {
    let message: String
}
```

Then here's a function that can fail by throwing `InputError`:

```swift
func readInt(
    message: String,
    errorMessage: String
) throws(InputError) -> Int {
    print(message)
    let rawInput = readLine() ?? ""
    
    if let number = Int(rawInput) {
        return number
    }
    else {
        throw InputError(message: errorMessage)
    }
}
```

In this example, the `readInt` is a typed throwing function, it can only throw `InputError`.  If the user input can't be converted to an Int, we throw an `InputError` with a custom message. If the input is fine, we return the number as usual.

In the following snippet, we introduce a second error type: 

```swift
enum MathError: Error {
    case divisionByZero
}

func main() throws {
    let a = try readInt(
        message: "Please enter A as a number:", 
        errorMessage: "A is invalid."
    )
    let b = try readInt(
        message: "Please enter B as a number:", 
        errorMessage: "B is invalid."
    )     
    if b == 0 {
        throw MathError.divisionByZero
    }
    else {
        print(a/b)
    }
}
```

The `main` function can throw any error because it doesn't specify a type. We call `try` before both calls to `readInt`, because each might throw an `InputError`. We manually check for division by zero and throw a `MathError` if needed.

We can handle various error types, using catch:

```swift
do {
    try main()
}
catch let error as InputError {
    print(error.message)
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

The `try?` keyword "converts" the throwing function into a non-throwing one. It returns an optional value instead of the original return type. If something goes wrong, `try?` returns `nil` instead of throwing an error and it returns the actual value if the function succeeds-but either way, it returns an optional:

```swift
func example() throws -> Int {
    return 10
}

let number: Int? = try? example()
print(number ?? -1)
```

Just like `try?`, the `try!` keyword lets you call a throwing function without using a do-catch block. But there's a big difference: if an error happens, that'll cause a fatal error and your app will crash:

```swift
func example() throws -> Int {
    return 10
}

let number: Int = try! example()
print(number)
```

The `rethrows` keyword is used in function definitions. It means the function itself doesn't throw errors, but it can pass along errors from a closure parameter that throws:

```swift
enum CustomError: Error {
    case ouch
}

func execute(
    closure: () throws -> Void
) rethrows {
    try closure()
}

let block: () -> Void = {
    print("This works without try!")
}

execute(closure: block)

let throwingBlock: () throws -> Void = {
    throw CustomError.ouch
}

try execute(closure: throwingBlock)
```

The `execute` function accepts a closure that might throw an error. But `execute` itself only rethrows an error if the closure it receives actually throws one. If the closure doesn't throw, `execute` behaves like a normal function. If the closure does throw, `execute` requires you to handle that possibility with try.
