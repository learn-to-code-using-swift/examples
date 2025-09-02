---
title: "The result type"
description: "Represent success or failure outcomes, simplify error handling, and replace optional result–error pairs with clearer code."
order: 29
---

At its core, `Result` is a special built-in enum type, that can hold either a value `success` or an error `failure`. Think of it as a container that represents the outcome of an operation: either things went well, or something went wrong.

This is how you can transform a throwing function to a non-throwing variant using the `Result` type:

```swift
func divide(
    _ x: Int,
    by y: Int
) throws(MathError) -> Int {
    guard y != 0 else {
        throw .divisionByZero
    }
    return x / y
}

func nonThrowingDivide(
    _ x: Int,
    by y: Int
) -> Result<Int, MathError> {
    do {
        let result = try divide(x, by: y)
        return .success(result)
    }
    catch {
        return .failure(error)
    }
}

let result = nonThrowingDivide(10, by: 2)
switch result {
case .success(let number):
    print(number)
case .failure(let error):
    print(error)
}
```

In the code below, both `result` and `error` are optionals, so you need to check each individually, and it's possible (though unlikely) for both to be nil or even both to have values, which complicates error handling and reduces code clarity:

```swift
func divide(
    _ x: Int,
    by y: Int,
    completion: (Int?, Error?) -> Void
) {
    guard y != 0 else {
        return completion(nil, MathError.divisionByZero)
    }
    completion(x / y, nil)
}

divide(10, by: 0) { result, error in
    if let result {
        print(result)
    }
    if let error {
        print(error)
    }
}
```

The Result type, by contrast, enforces a single, explicit outcome—either success or failure—making your completion blocks easier to read and maintain:

```swift
func divide(
    _ x: Int,
    by y: Int,
    completion: (Result<Int, MathError>) -> Void
) {
    guard y != 0 else {
        return completion(.failure(.divisionByZero))
    }
    completion(.success(x / y))
}

divide(10, by: 0) { result in
    switch result {
    case .success(let number):
        print(number)
    case .failure(let error):
        print(error)
    }
}
```

In the past, completion blocks were commonly used to handle asynchronous operations and their results. Today, developers increasingly prefer modern concurrency features, such as async/await, which offer clearer syntax and improved error handling compared to traditional completion blocks.
