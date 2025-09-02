---
title: "Functions"
description: ""
order: 19
---

Functions are self-contained pieces of code that perform a specific task. You give each function a name that describes what it does, and you use this name to "call" the function whenever you need it to do its job. This makes your code clearer, shorter, and more organized.

```swift
func greet() {
    print("Hello World!")
}

greet()
```

Functions can accept parameters, which are values you pass into the function to customize its behavior. By defining parameters, you allow your function to work with different inputs each time it is called:

```swift
func greet(
    name: String
) {
    print("Hello, \(name)!")
}
greet(name: "Tibor") 
greet(name: "Kitti") 
```

You can customize how you use functions and make them easier to understand by adding custom **argument labels**. These labels appear before the parameter name and are separated by a space. They help make your function calls more readable and user-friendly:

```swift
func greet(
    to name: String
) {
    print("Hello, \(name)!")
}

greet(to: "Tibor")
```

If you do not want to use a label at all, place an underscore `_` before the parameter name. This allows you to call the function using just the parentheses and the argument, without any label. The function's behavior stays the same, so you can choose to show or hide argument labels based on what makes your code clearer and easier to read:

```swift
func greet(
    _ name: String
) {
    print("Hello, \(name)!")
}
// calling the function
greet("Tibor")
```

When using default parameter values, you can omit that argument from the function call. If you do, the function will automatically use the default value you provided:

```swift
func greet(
    to name: String = "Guest" 
) {
    print("Hello, \(name)!")
}

greet() 
greet(to: "Tibi")
```

Functions can also have more than one parameter:

```swift
func sumNumbers(
    _ a: Int, 
    _ b: Int
) {
    let sum = a + b
    print("Sum: ", sum)
}
// function call with two arguments: 42 and 69
sumNumbers(42, 69)
```

A variadic parameter in Swift lets a function accept zero or more values of a specific type, so you can pass any number of arguments you need. To define a variadic parameter, add `...` after the parameter's type:

```swift
func sumNumbers(
    _ numbers: Int...
) {
    var sum = 0
    for number in numbers {
        sum += number
    }
    print("Sum: ", sum)
}

sumNumbers()
sumNumbers(42)
sumNumbers(42, 69)
sumNumbers(42, 69, 4, 2, 6, 9)
```

Parameter overloading allows you to define multiple functions with the same name, as long as they have different parameter types or a different number of parameters. This is also known as function overloading:

```swift
// function with Int type parameter
func displayValue(value: Int) {
    print("Integer value:", value)
}

// function with String type parameter
func displayValue(value: String) {
    print("String value:", value)
}

// function call with String type parameter
displayValue(value: "Swift")

// function call with Int type parameter
displayValue(value: 2)
```

Swift will automatically choose the correct function to call based on the type and number of arguments you provide. It uses both the number and types of parameters to determine which version of the function to execute.

A function return type specifies the type of value a function gives back after it finishes executing. The return value is the actual result that the function produces:

```swift
func square(number: Int) -> Int {
    let result = number * number
    return result
}

let result = square(number: 4)
print(result)

let doubled = result * 2
print(doubled) 
```

For functions that have only a single expression, you can leave out the `return` keyword and simply write the expression itself:

```swift
func square(number: Int) -> Int {
    number * number
}
```

A function can also return a tuple, allowing you to return multiple values at once. Tuples group several values into a single compound value, which can be useful when you want to provide more than one result from a function:

```swift
func minMax(
    numbers: [Int]
) -> (min: Int, max: Int) {
    let minValue = numbers.min() ?? 0
    let maxValue = numbers.max() ?? 0
    return (min: minValue, max: maxValue)
}

let result = minMax(numbers: [3, 7, 2, 9])
print(result.min)
print(result.max)
```

In this example, the `minMax` function returns both the minimum and maximum values from an array as a tuple.


