---
title: "Arrays"
description: "Create, access, and modify arrays, use mutating and non-mutating methods, and explore sorting, shuffling, and more."
order: 9
---

An array is a collection that holds values in a specific order.

Arrays in Swift can store values of any standard data type, including `String`, `Int`, `Double`, and `Bool`. Swift's type inference makes it easy to create arrays without explicitly specifying their types:

```swift
// Array of String elements, type inferred
let names = ["Kitti", "Tibi", "Havoc"]

// Array of Int elements, explicit type annotation
let integers: Array<Int> = [1, 2, 3]

// Array of Double elements, short type syntax
let doubles: [Double] = [2.6, 3.4, 4.8]

// Array of Bool elements, type inferred
let booleans = [true, false]

// Array of String elements, empty array
let empty: [String] = []
```

We can even create an array by using a range or repeating an element:

```swift
let smallNumbers = Array(0...10)

let helloArray = Array(repeating: "hello", count: 10)
```
You can easily check whether an array is empty, see how many items it holds, and grab elements by their index. Swift lets you access the first and last items, look up the valid index range, and even pick a random element. You can also find out if an array includes a certain value or get the index of a specific item:

```swift
let numbers = [42, 7, 13, 99, 5]

// Checks if the array contains no elements
print(numbers.isEmpty)

// Returns the total number of elements in the array
print(numbers.count)

// Retrieves the element at a specific index position
print(numbers[0])
print(numbers[1])
print(numbers[2])

// Provides the valid index range for the array
print(numbers.indices)

// Accesses the first and last elements, respectively
print(numbers.first!)
print(numbers.last!)

// Returns a set number of elements from the start or end
print(numbers.prefix(2))
print(numbers.suffix(2))

// Selects a random element from the array
print(numbers.randomElement()!)

// Checks if a specific value exists in the array
print(numbers.contains(13))
print(numbers.contains(100))

// Returns the index of an element, or nil if not found
print(numbers.firstIndex(of: 7)!)

// Returns the smallest and largest values in the array
print(numbers.min()!)
print(numbers.max()!)
```

To modify an array, it must be declared as a variable using the `var` keyword, since constant arrays cannot be changed. These functions allow you to update, add, or insert elements when working with mutable arrays:

```swift
// Updates the element at a specific index
var dailyActivities = ["Eat", "Repeat"]
dailyActivities[1] = "Sleep"

// Adds a single element to the end of the array
dailyActivities.append("Yoga")

// Adds multiple elements to the end of the array
dailyActivities.append(contentsOf: ["Rest", "Repeat"])

// Concatenates another array to the end of the array
dailyActivities += ["Rest", "Repeat"]

// Inserts an element at a specified position in the array
dailyActivities.insert("Learn", at: 0)
dailyActivities.insert("Drink", at: dailyActivities.count)
```

Swift provides plenty of ways to remove elements from an array, such as removing the first item, removing the last item, removing at a specific index or removing a range of elements:

```swift
// Removes the first N elements from the array
dailyActivities.removeFirst()
dailyActivities.removeFirst(2)

// Removes the last N elements from the array
dailyActivities.removeLast()
dailyActivities.removeLast(2)

// Removes the element at a specific index
dailyActivities.remove(at: 2)

// Removes a range of elements from the array
dailyActivities.removeSubrange(2...3)

// Removes all elements from the array
dailyActivities.removeAll()
```

These mutating functions modify the original array:

```swift
// Swaps the elements at the specified indices
dailyActivities.swapAt(0, 2)

// Reverses the order of the elements in the array
dailyActivities.reverse()

// Sorts the elements of the array in ascending order
dailyActivities.sort()

// Randomly shuffles the elements in the array
dailyActivities.shuffle()
```

Non-mutating functions always return a new array. In Swift, there are both mutating and non-mutating versions of functions like `sort()` and `sorted()`. This naming convention helps you know which functions change the original array and which do not.


```swift
let numbers = [42, 7, 13, 99, 5]

// Sorted array
let sortedNumbers = numbers.sorted()

// Reversed collection
let reversedNumbers = numbers.reversed()

// Shuffled array
let shuffledNumbers = numbers.shuffled()
```

Non-mutating functions leave the original array unchanged. This means you can use them on constant values, since they do not modify the original array but instead give you a new one.



