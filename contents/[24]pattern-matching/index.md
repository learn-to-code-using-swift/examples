---
title: "Pattern matching"
description: ""
order: 24
---


Pattern matching lets you look inside values and work with their data. It's a way to check what kind of data you have — and at the same time, extract the information you need.

```swift
let foo: String? = "foo"
if let value = foo {
    print("Unwrapped value: \(value)")
}
```

So, if let is a type of pattern matching — just like using tuples to match the shape of data and respond accordingly:

```swift
let point = (3, 0)

switch point {
case (0, 0):
    print("Origin")
case (_, 0):
    print("On the X-axis")
case (0, _):
    print("On the Y-axis")
default:
    print("Somewhere else")
}
```

In Swift, pattern matching lets you extract values from enums that have associated values.

```swift
enum PaymentMethod {
    case cash
    case bankTransfer(String)                      
    case creditCard(number: String, cvv: Int)      
    case digitalWallet(String, email: String)      
    case crypto(network: String, wallet: String)   
    case cheque(id: String, bank: String)        
}

let method1 = PaymentMethod.cash

switch method1 {
case .cash: 
    print("Cash payment")
case .bankTransfer(let account): 
    print("Bank transfer from account: \(account)")
case let .creditCard(number: number, cvv: cvv): 
    print("Credit card: \(number)")
case let .digitalWallet(_, email):
    print("Digital wallet for: \(email)")
case .crypto(network: let network, wallet: let wallet): 
    print("Crypto: \(network) - \(wallet)")
case .cheque: 
    print("Cheque payment")
}
```

The if case let statement checks whether method is a `.bankTransfer` case. If it is, it extracts the associated value (the bank account number), stores it in a variable called `account`, and prints it:

```swift
if case let PaymentMethod.bankTransfer(account) = method2 {
    print(account)
}
```

You could achieve the same result using a switch statement, but it would require more lines of code:

```swift
switch method2 {
case let .bankTransfer(account):
    print(account)
default:
    break
}
```

Swift also lets us match optionals using pattern matching—specifically with `if case .some(value)`. This allows you to use the same case let matching technique you've seen with enums when working with optionals. Take a moment to consider this code snippet:

```swift
let name: String? = "Kitti"

if let unwrapped = name {
    print("Hello, \(unwrapped)")
}

if case let .some(unwrapped) = name {
    print("Hello, \(unwrapped)")
}

if let name {
     print("Hello, \(name)")
}
```

You can also combine pattern matching and regular boolean checks in the same if statement. This is especially helpful when you want to validate both the structure and the content of data, such as when working with enums or optionals:

```swift
if
    case PaymentMethod.bankTransfer(let account)? = method2,
    !account.isEmpty, 
    account.count == 17 || account.count == 26
{
    print("Valid account: \(account)")
}
```

You can also write the same condition in a slightly more detailed way using the `&&` operator:

```swift
if
    case PaymentMethod.bankTransfer(let account)? = method2,
    !account.isEmpty &&
    (
        account.count == 17 || 
        account.count == 26
    )
{
    print("Valid account: \(account)")
}
```

A where clause lets you add more checks after matching the pattern. It is commonly used in both **switch** and **for** statements. Let's look at our earlier example again, but this time using a switch statement:

```swift
switch method2 {
case let .bankTransfer(account)
    where
        !account.isEmpty &&
        (
            account.count == 17 ||
            account.count == 26
        )
    :
    print("Suspicious card detected")
default:
    break
}
```

The for loop also supports different pattern matching techniques. You can use for case to go through an array of enums and filter only the cases that match.

```swift
var numberOfCashPayments = 0
for case .cash in methods {
    numberOfCashPayments += 1
}
print("Number of cash payments: \(numberOfCashPayments)")
```

You can also extract associated values if the case includes them:

```swift
for case .bankTransfer(let account) in methods {
    print("Bank transfer from account: \(account) payment")
}
```

Just like with switch statements, you can use the where clause to further narrow down the matching cases:

```swift
var numberOfValidAccountNumbers = 0
for case let .bankTransfer(account) in methods where !account.isEmpty {
    numberOfValidAccountNumbers += 1
}
print("Number of valid account numbers: \(numberOfValidAccountNumbers)")
```

The where clause isn't limited to looping through enums—you can also use it to filter regular arrays. For example, it works like this:

```swift
let numbers = [1, 2, 3, 4, 5]

for number in numbers where number > 3 {
    print(number)
}
```

Since we've been talking about loops, it's also good to know that you can use if-case-let in other places, such as while loops:

```swift
enum Token {
    case number(Int)
    case end
}

let tokens: [Token] = [
    .number(1), 
    .number(2), 
    .number(10), 
    .end
]
var index = 0

while case let .number(value) = tokens[index], value < 5 {
    print("Found number: \(value)")
    index += 1
}
```

Pattern matching is a widely used and highly powerful feature in Swift.

