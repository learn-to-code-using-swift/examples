---
title: "Dictionaries"
description: ""
order: 11
---


A dictionary is a collection that stores **key–value pairs**. Each value is associated with a unique key, which lets you look up values quickly. Unlike arrays, which use integer indexes, dictionaries allow keys of any `Hashable` type such as `String`, `Int`, or `Bool`.

```swift
// Dictionary with String keys and String values
let capitals = [
    "France": "Paris",
    "Japan": "Tokyo",
    "Brazil": "Brasília"
]

// Empty dictionaries
let dict1: Dictionary<String, Int> = [:]
let dict2: [String: Int] = [:]
let dict3 = [String: Int]()
```

Dictionaries automatically enforce uniqueness of keys. If the same key is used twice, the last value replaces the earlier one.

You can check basic properties, access values, and list keys or values:

```swift
// Check if the dictionary is empty
print(capitals.isEmpty)   

// Get the number of key–value pairs
print(capitals.count)      

// Access a value
print(capitals["France"]!)

// Safe access with default value
print(capitals["India", default: "Not found"])

// Access all keys
print(capitals.keys) 

// Access all values
print(capitals.values)
```

To modify a dictionary, declare it with `var`. Adding or updating a key is done using assignment. Removing items can be done by assigning `nil` or using `.removeValue(forKey:)`:

```swift
var capitals = [
    "France": "Paris",
    "Japan": "Tokyo"
]

// Add a new key–value pair
capitals["Hungary"] = "Budapest"

// Update an existing value
capitals["Japan"] = "Kyoto"

// Remove a value by key
capitals["France"] = nil
capitals.removeValue(forKey: "Japan")

// Remove all key–value pairs
capitals.removeAll()
```

Dictionaries also support quick lookups and utility methods:

```swift
let scores = [
    "Alice": 95,
    "Bob": 78,
    "Charlie": 88
]

// Check if a key exists
print(scores["Alice"] != nil)

// Check if any value matches a condition
print(scores.contains { $0.value > 90 }) 
```

Keys and values are usually homogeneous types (all the same), but values can also be stored as `Any` if needed:

```swift
let person: [String: Any] = [
    "name": "John Doe",
    "age": 30,
    "isDeveloper": true
]

// Safely casts the "name" value to String using as?
let name = person["name"] as? String ?? "unknown"
print(name)
```

Dictionaries are ideal when you need fast lookups by key and to ensure that each key is unique within the collection.


