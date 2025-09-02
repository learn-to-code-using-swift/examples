---
title: "Structs"
description: ""
order: 22
---

A structure (or struct for short) is a custom data type used to group related data and actions together. 

```swift
struct Car {
    let brand: String
    let numberOfDoors: Int
    var color: String
    var currentSpeed: Int
}
```

Each property in the struct is just a regular variable or constant; they have a name and a type defined.

To use a struct, you need to create an instance of it. This means making a real, usable object — either a constant or a variable — based on your previously defined structure:

```swift
var myCar = Car(
    brand: "Ferrari",
    numberOfDoors: 3,
    color: "red",
    currentSpeed: 0
)

print(myCar.brand)
print(myCar.color)

myCar.color = "blue"
print(myCar.color)
```

Swift automatically provides a memberwise initializer when you define a struct with stored properties. You can use this initializer to set the properties of new struct instances.

You can define your own custom initializer for more control over how your struct is created. Defining your own `init()` method is helpful if you need extra logic during initialization, such as setting default values for properties, as shown below:

```swift
struct Point {
    let x: Int 
    let y: Int 

    init(
        x: Int = 0, 
        y: Int = 0
    ) {
        self.x = x
        self.y = y
    }
}

let point = Point(y: 5)
print(point)
```

If all the properties have a default value and no custom initializers are defined, there's no need to explicitly declare an `init()` function. You can simply set default values after each property, and Swift will automatically provide a default initializer that takes no parameters:

```swift
struct Car {
    var color: String = "Red"
    var doors: Int = 4
}

let car = Car()
print(car)
```

Structs can have computed properties; they return values _dynamically_. Unlike stored properties, they don't keep a value in memory. Instead, the value is calculated _on the fly_ whenever you access the property. Computed properties must have a getter, and they can also have a setter if you want to allow assignments:


```swift
struct Circle {
    var radius: Double

    var diameter: Double {
        get {
            return radius * 2  
        }
        set {
            radius = newValue / 2
        }
    }
}

var myCircle = Circle(radius: 5)
print(myCircle.diameter)
print(myCircle.radius)

myCircle.diameter = 40
print(myCircle.diameter)
print(myCircle.radius)
```

Static properties belong to the struct type itself, not to individual instances. This means all instances of the struct _share_ the same static property, which is stored only once, not separately for each instance — saving memory.

```swift
struct Circle {
    static let pi = 3.14159
}

print(Circle.pi)
```

A lazy property is only calculated the first time it's accessed. Lazy stored properties must always be variables, since their value is set later. This helps you avoid unnecessary computation if the property is never actually used.

```swift
struct Person {
    let firstName: String
    let lastName: String

    lazy var fullName: String = {
        print("Computing full name..")
        return "\(firstName) \(lastName)"
    }()
}

var person = Person(
    firstName: "John",
    lastName: "Doe"
)

print(person.fullName)
print(person.fullName)
```

Property observers let you run code whenever a property changes. You can use them with stored properties — both variables and computed properties that have a setter — to react before and after a new value is assigned:

```swift
struct SmartAC {
    var celsius: Double {
        willSet {
            if newValue >= 25 {
                print("⚠️ Warning: The temperature is about to reach \(newValue)°C. Consider turning on the AC!")
            }
        }
        didSet {
            if celsius >= 25 && oldValue < 25 {
                print("🌡️ Temperature just hit \(celsius)°C! AC is now ON. ❄️")
            } 
            else if celsius < 25 && oldValue >= 25 {
                print("✅ Temperature dropped below 25°C. AC is OFF.")
            }
        }
    }
}

var room = SmartAC(celsius: 22)  

room.celsius = 23
room.celsius = 25
room.celsius = 28
room.celsius = 24
```

A non-mutating function in a struct is a function that does not change the instance's data:

```swift
struct Rectangle {
    let width: Double
    let height: Double

    func getArea() -> Double {
        return width * height
    }
}

let rect = Rectangle(
    width: 5, 
    height: 10
)
let area = rect.getArea()
print(area)
```

Mutating methods change the internal state of the struct—they modify one or more of its properties (instance variables):

```swift
struct Counter {
    var value: Int = 0

    mutating func increment(
        by value: Int = 1
    ) {
        self.value += value
    }
}

var counter = Counter()
counter.increment(by: 5)

print(counter.value)
```

You can also use a mutating method to replace the entire instance with a new value. In this case, you assign a new value to `self`:

```swift
struct Rectangle {
    var width: Double
    var height: Double

    mutating func makeSquare(
        withSide side: Double
    ) {
        self = Rectangle(
            width: side,
            height: side
        )
    }
}

var rect = Rectangle(width: 10, height: 5)
rect.makeSquare(withSide: 8) // Replaces the instance
print(rect)
```

Just like static properties, static methods belong to the struct type itself, not to individual instances. This means you call a static method on the type, not on an instance:

```swift
struct Point {
    var x: Double
    var y: Double

    static func distance(
        from point1: Point, 
        to point2: Point
    ) -> Double {
        let dx = point2.x - point1.x
        let dy = point2.y - point1.y
        return (dx * dx + dy * dy).squareRoot()
    }
}

let pointA = Point(x: 3, y: 4)
let pointB = Point(x: 7, y: 1)

let distance = Point.distance(from: pointA, to: pointB)
print("Distance: \(distance)")
```

Since this is a static method, you don't need to call it on an instance; you can use it directly on the `Point` struct itself.

