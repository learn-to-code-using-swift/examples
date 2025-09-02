---
title: "Generics"
description: ""
order: 32
---

Generics functions are here to help us reuse code, avoid redundancy and even do it in a type-safe way. Instead of writing multiple functions, we can use a "generic placeholder" type, in this case, we call that `T` and we write it right after the function name inside `<>`. 

The main point is that these placeholders can stand for any type, based on how you use the function. The placeholder will be resolved—with the actual type—when you call the function:

```swift
func returnFirst<T>(_ array: [T]) -> T {
    array[0]
}

let strings: [String] = ["apple", "banana", "cherry"]
let firstString = returnFirst(strings)
print(firstString)

let numbers: [Int] = [20, 10, 1]
let firstInt = returnFirst(numbers)
print(firstInt)
```

You can also apply constraints to generics functions. The function `duplicate` takes an array of generic type, but with one condition: it needs to conform to the `Numeric` protocol. 

```swift
func duplicate<T: Numeric>(_ array: [T]) -> [T] {
    array.map { $0 * 2 }
}

let integers: [Int] = [4, 2, 6, 9]
print(duplicate(integers))

let doubles: [Double] = [3.14, 4.20, 6.9]
print(duplicate(doubles))

let strings: [String] = ["a", "b", "c"]
print(duplicate(strings)) // compiler error
```

There's another way to do this, which you've seen before: using the where clause. You can also apply constraints by using the `where` keyword after the function:

```swift
func duplicate<T: Numeric>(_ array: [T]) -> [T] {
    array.map { $0 * 2 }
}

func duplicate<T>(_ array: [T]) -> [T] where T: Numeric {
    array.map { $0 * 2 }
}
```

You can declare as many different generic parameters as you need, just list them each in separate angle brackets (`<>`), separated by commas `(,)`. Angle brackets tell the compiler to expect a placeholder type, not a concrete one.

```swift
func mapValues<T, U>(
    _ array: [T],
    transform: (T) -> U
) -> [U] {
    var newArray: [U] = []
    for item in array {
        let newItem = transform(item)
        newArray.append(newItem)
    }
    return newArray
}

let numbers: [Int] = [4, 2, 6, 9]
let strings: [String] = mapValues(numbers) { number in
    String(number) + " items"
}
print(strings)
```

You can go further and add constraints to multiple generic parameters too, even having specified constraints for each parameter.

