---
title: "Operators"
description: "Explore assignment, arithmetic, comparison, logical, and compound operators for effective Swift programming."
order: 5
---

In most programming languages, including Swift, the assignment operator is the equal character `=`. The assignment operator is used to assign a value to a variable or constant:

```swift
let a = 12
var b = 4

b = a
```

The addition operator sums up two values or concatenates two `String` values. It's represented by the plus sign `+`:

```swift
let a = 12
let b = 4

print(a + b)

print("Hello, " + "World!")
```

You can take one number away from another to find the difference by using the subtraction operator, `-` minus sign:

```swift
let a = 12.8
let b = 4.2

print(a - b)
```

Multiplication `*` is a mathematical operation where a number is added to itself a certain number of times, based on another number, to get the total value:

```swift
let a = 12
let b = 4

print(a * b)
```

Division `/` is also a mathematical operation where one number (divident) is split into equal parts, determined by another number (divisor), to find how many times it fits (quotient):

```swift
let a = 12.8 
let b = 4.2

print(a / b)
```

Swift gives you a fatal error if you try to divide a number by zero:

```swift
let a = 12
let b = 0

print(a / b) // Fatal error: Division by zero
```

If you divide two `Int` values, Swift gives you an `Int` result by removing any decimal part:

```swift 
let result = 7 / 2
print(result) // 3, not 3.5!
```

To get a precise result with decimals, you need to convert the values to a `Double` before the division. 

```swift
let result = Double(7) / Double(2)

print(result)
```

In connection to this, it's not possible to add up two different data types:

```swift
let a: Int = 12
let b: Double = 4.2

print(a + b) // error
```

Arithmetic operations generally require operands to be of the same type, and Swift does not automatically convert between types like some other languages do.

In this case it's necessary to convert one data type to another:

```swift
let a: Int = 12
let b: Double = 4.2

print(Double(a) + b) 
print(a + Int(b))
```

There is a shorthand for each arithmetic operator. The operation can be combined with assignment, like this:

```swift
var a = 1

a += 1
a -= 1
a *= 1
a /= 1
```

These are called compound assignment operators and this way you don't have to write the variable name twice. 

The remainder operator `a % b` works out how many multiples of b will fit inside a and returns the value that's left over (known as the remainder or modulo):

```swift
let candies = 7
let friends = 2

print(candies % friends)
```

A comparison operator (is equal to, is not equal to, greater than, greater than or equal to, less than, less than or equal to) compares two values and returns a `Bool` value:

```swift
let a = 5
let b = 3

print(a == b)
print(a != b)
print(a > b)
print(a >= b)
print(a < b)
print(a <= b)
```

Comparison operator operands must also be of the same type, or you need to perform type casting before comparing them.

The logical "not" operator `!` reverses a boolean value, turning `true` into `false` and `false` into `true`:

```swift
let isSuccess = true

print(!isSuccess)
```

The logical "and" operator `&&` returns `true` only if **both conditions** being compared are `true`; otherwise, it returns `false`:

```swift
let first = true
let second = false

print(first && second)
```

The logical "or" operator `||` returns true if at least **one of the conditions** being compared is `true`; otherwise, it returns `false`:

```swift
let first = true
let second = false

print(first || second)
```

You can combine multiple operators in a single expression. To control the order in which operations are performed, use parentheses to override the default precedence rules.
