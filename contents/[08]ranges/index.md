---
title: "Ranges"
description: ""
order: 8
---

A closed range in Swift includes both its starting and ending values. It is created using the `...` operator:

```swift
let range: ClosedRange<Int> = 1...6
```

The `...` operator defines a closed range, where `1` is the lower bound (the first element) and `6` is the upper bound (the last element).

Type inference also works with ranges, so Swift can infer the type as `ClosedRange<Int>`, because both 1 and 6 are integers and the `...` operator creates a closed range of the same type:

```swift
let range = 1...6
```

A half-open range includes all the values from the lower bound and excludes the upper bound (last number). Of course type inference works with half-open ranges too:

```swift
let range: Range<Int> = 1..<6

let range:  = 1..<6
```

A one-sided range contains elements up to infinite in one direction. We can create a one-sided range using either of the `...` or the `..<` operator (type inference works here as well):

```swift
let range: PartialRangeThrough<Int> = ..<5

let range = ..<5
```

The following range contains all elements from 5 to positive infinity:

```swift
let range: PartialRangeFrom<Int> = 5...

let range:  = 5...
```

The contains function checks if a value exists within a range. 

```swift
let range = 1...30

print(range.contains(1)) 
print(range.contains(42))
```

You can use ranges to generate random numbers from the given range. It is also possible to generate a random Boolean value using the random function:

```swift
let randomBool = Bool.random()
print(randomBool)

print(Int.random(in: 1...6))
```

This also works with other integer and floating point types.


