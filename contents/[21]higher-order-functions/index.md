---
title: "Higher order functions"
description: ""
order: 21
---

In Swift, any function that either takes another function (or closure) as a parameter or returns a function (or closure) as its result is called a higher-order function.

These functions take a closure as a parameter and perform an operation, and they are commonly used for sorting, filtering, mapping, reducing, and searching collections:

```swift
let array = [1, 5, 2, 3, 2, 4]

// Sort the array in descending order
print(array.sorted { $0 > $1 })

// Sort the array in ascending order using the < operator
print(array.sorted(by: <))

// Find the first element equal to 3, or "n/a" if not found
print(array.first { $0 == 3 } ?? "n/a")

// Filter elements greater than 3
print(array.filter { $0 > 3 })

// Double each element in the array
print(array.map { $0 * 2 })

// Convert each element to a string and join with commas
print(array.map(String.init).joined(separator: ", "))

// Check if all elements are greater than 1
print(array.allSatisfy { $0 > 1 })

// Sum all elements in the array
print(array.reduce(0, +))

// Check if any element is greater than 3
print(array.reduce(false) { $0 || $1 > 3 })

// Check if all elements are greater than 1 using reduce
print(array.reduce(true) { $0 && $1 > 1 }) 
```

Some of these functions will work on sets and other sequence & collection types. Feel free to experiment with them.

Arrays aren't the only collection type that can benefit from higher-order functions. Swift dictionaries also support many of the same methods—such as filter, mapValues, and reduce:

```swift
let dict = [
    "math": 5,
    "chemistry": 3,
    "biology": 4,
    "music": 2
]

// Keeps only subjects with grades greater than 3
let filtered = dict.filter { item in
    item.value > 3
}
print(filtered) 

// Subtracts one point from each grade
let updated = dict.mapValues { $0 - 1 }
print(updated)

// Removes subjects with grades not greater than 3
let cleaned = dict.compactMapValues { value -> Int? in
    value > 3 ? value : nil
}
print(cleaned)

// Merge dictionaries, keep original values
let original = ["a": 1, "b": 2]
let updates = ["a": 3, "b": 4]
let keepOriginal = original.merging(updates) { orig, _ in
    orig
}
print(keepOriginal)

// Merge dictionaries, use new values
let replaceWithNew = original.merging(updates) { _, new in
    new
}
print(replaceWithNew)

// Sum prices in a dictionary
let prices = [
    "Apple": 2, 
    "Banana": 1, 
    "Cherry": 3
]
let total = prices.reduce(0) { sum, item in
    sum + item.value
}
print("Total Price: \(total)")
```

You can use reduce for other types of aggregation too—like building a string, finding a maximum value, or collecting specific items.
