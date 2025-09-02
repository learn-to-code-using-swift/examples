---
title: "Enums"
description: "Define cases, use raw and associated values, add methods, computed properties, mutating functions, static members, and custom initializers."
order: 23
---

In Swift, an enum (short for enumeration) is a user-defined data type that represents a fixed set of related values. You select one of these values at a time, and Swift makes sure your choice is always valid — enums are type-safe by design.

```swift
enum CompassDirection {
    case north
    case northEast
    case east
    case southEast
    case south
    case southWest
    case west
    case northWest
}

var direction: CompassDirection = .north
```

You might want to give each case extra meaning, such as associating a String value or storing a number with a case.

Swift offers two ways to do this: raw values and associated values. Both let you add data to enum cases, but they have different purposes and follow different rules. An enum can have either raw values or associated values, but not both at the same time.

Here’s how to work with raw values of different types:

```swift
enum Size: Int {
    case small = 10
    case medium = 12
}

enum Role: String {
    case guest
    case editor
    case superUser = "super-user"
}

enum Movement: Character {
    case up = "w"
    case down = "s"
    case left = "a"
    case right = "d"
}


print(Size.small.rawValue)
print(Role.editor.rawValue) 
print(Movement.up.rawValue)

let invalid: Movement? = Movement(rawValue: "fff")  

let valid: Movement? = Movement(rawValue: "w")      
```

In Swift, you can make an enum conform to the `CaseIterable` protocol to automatically access a collection of all its cases. The compiler automatically creates a static `allCases` property on the enum, which will contain all the available cases.

This makes it easy to loop through every case in the enum without having to create an array manually:

```swift
enum Movement: CaseIterable {
    case up
    case down
    case left
    case right
}

for movement in Movement.allCases {
    print(movement)
}
```

You can also add extra information to an enum case. These are called associated values, and they can be of any type. The type of associated value can be different for each case in the enum if needed:

```swift
enum PaymentMethod {
    case cash
    case bankTransfer(String) 
    case creditCard(String, Int)
}

print(PaymentMethod.cash)

print(PaymentMethod.bankTransfer("12341234-12341234"))

print(PaymentMethod.creditCard("1234-1234-1234-1234", 456))
```

However, there may be times when you want an enum to start with a default case, or to run some custom logic before choosing a case. In these situations, you can define a custom initializer.

For example, you can write your own init method to set a default case:

```swift
enum Direction {
    case ascending
    case descending

    init() {
        self = .ascending
    }
}

let dir = Direction()
print(dir)
```

With custom initializers, you can also add logic to decide which case to use — even for cases that have associated values:

```swift
enum Payment {
    case cash
    case card(number: String)

    init(useCard: Bool) {
        if useCard {
            self = .card(number: "XXXX-XXXX-XXXX-XXXX")
        } 
        else {
            self = .cash
        }
    }
}
var pay1 = Payment(useCard: true)
var pay2 = Payment(useCard: false)
print(pay1)
print(pay2)
```

Just like structs, enums can also have methods. This means you can define functions inside the enum itself. These functions can access the enum's current value via the `self` keyword and either return information or perform actions based on that.

```swift
enum TrafficLight {
    case red
    case yellow
    case green

    func description() -> String {
        switch self {
        case .red:
            return "Stop"
        case .yellow:
            return "Get ready"
        case .green:
            return "Go"
        }
    }
}

let currentLight = TrafficLight.red
let desc = currentLight.description()
print(desc)
```

A common use for mutating methods in enums is to switch the current case to another one. This is often seen in finite state machines, toggle switches, or step-based flows. Here's a simple example:

```swift
enum Mode {
    case off
    case low
    case high

    mutating func toggle() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

var device = Mode.off
print(device)

device.toggle()
print(device)

device.toggle()
print(device)
```

Computed properties calculate a value dynamically instead of storing it. They return values derived from the current case (`self`). They cannot store state — they calculate a result when accessed:

```swift
enum Direction {
    case ascending
    case descending

    var isAscending: Bool {
        self == .ascending
    }
}

let dir = Direction.descending
print(dir.isAscending)
```

Sometimes you just want to define values or functionality that belong to the enum as a whole. Enums can also contain static methods and static properties, which belong to the type itself, not instances:

```swift
enum AppConfig {
    
    static let appName = "SuperApp"

    static func getAppInfo() -> String {
        "Welcome to \(appName)!"
    }
}

print(AppConfig.appName)      
print(AppConfig.getAppInfo()) 
```

Enums with static members are widely used in real projects to group tools and constants under a clear, descriptive name.

This approach is similar to how static members work in structs and is often used for constants and configuration, shared utilities, or even factory methods.

