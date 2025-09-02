---
title: "Sets"
description: ""
order: 10
---

In Swift, a Set is a collection type that stores unique values of the same type in _no particular order_. Unlike arrays, sets don't allow duplicate values, and since they don't preserve the order of elements, we call them unordered collections. Also, in some cases, sets are faster than arrays. There are several ways to create sets:

```swift
// using the full syntax
let set1: Set<String> = []
// using the short syntax
let set2 = Set<String>()
// using type inference
let set3: Set = ["A", "B"]
```

Note that duplicate values are automatically removed when creating a set. You can also check set properties and access elements in ways similar to arrays, such as verifying if the set is empty, counting its elements, or retrieving a random element:

```swift
let numbers: Set<Int> = [1, 2, 3, 2, 1]   

// Check if the set is empty
print(numbers.isEmpty)       

// Get the number of elements in the set 
print(numbers.count)

// Get a random element from the set
print(numbers.randomElement()!)
```
You can insert elements into a set, remove specific elements, remove any element, or clear all elements. You can also check if a set contains a particular value:

```swift
var roles: Set = ["view", "edit"]

// Add a new element to the set
roles.insert("manage")       

// Remove an exact element from the set 
roles.remove("edit")       

// Remove the first element from the set
roles.removeFirst()

// Remove all elements from the set
roles.removeAll()

// Check if a specific element exists in the set
print(roles.contains("view")) 
```

Sets don’t preserve order, but you can sort them into an array:

```swift
var numbers: Set<Int> = [21, 34, 54, 12]

let ascendingNumbers = numbers.sorted()
print(ascendingNumbers)

let descendingNumbers = numbers.sorted(by: >)
print(descendingNumbers)
```

They also support fast set operations:

```swift
let first: Set = [1, 2, 3, 5]
let second: Set = [0, 2, 3, 4]

// Combine all unique elements from both sets
print(first.union(second))            

// Find elements present in both sets
print(first.intersection(second))     

// Get elements in 'first' that are not in 'second'
print(first.subtracting(second))      

// Find elements that are in either set, but not both
print(first.symmetricDifference(second))
```

Relationship checks are also built in:

```swift
let a: Set = [1, 2]
let b: Set = [1, 2, 3, 4]

// Check if all elements in 'a' are also contained in 'b'
print(a.isSubset(of: b))

// Check if 'b' contains every element in 'a'
print(b.isSuperset(of: a))

// Check if 'a' and another set share no common elements
print(a.isDisjoint(with: [5, 6]))
```

Sets are sometimes faster than arrays for membership checks and set operations because they use hash-based storage, allowing for constant-time lookups and modifications.











