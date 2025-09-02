---
title: "Error types"
description: "Define enums and structs conforming to Error, throw meaningful errors, and use them with Swift’s error handling system."
order: 25
---

In Swift, we often use enums and sometimes structs to create meaningful error representations. An enum must conform to the `Error` protocol to act as an error type:

```swift
enum NetworkError: Error {
    case noConnection
    case timeout
    case invalidResponse
}
```

To create a struct for error representation, just make the struct conform to the `Error` protocol and define the properties that will carry the error details:

```swift
struct CustomError: Error {
    let message: String
    let code: Int
}
```

By conforming a struct or enum to the `Error` protocol, you enable these types to be thrown as errors in your code. Using the `throw` keyword, you signal that an error has occurred and that it must be handled appropriately:

```swift
throw NetworkError.timeout

throw CustomError(
    message: "Not found", 
    code: 404
)
```

In the following example, you will learn how to properly catch and respond to these thrown errors using Swift's do-catch system.

