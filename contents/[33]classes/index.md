---
title: "Classes"
description: "Define initializers, convenience inits, computed and type properties, methods, reference semantics, protocol conformance, and inheritance."
order: 33
---


Classes are a key concept in Swift. They let you model complex things by putting data and behavior together in a single structure.


```swift
class Bike {
    var name: String

    init(name: String) {
        self.name = name
    }
}
```

It's also possible to create so-called **convenience** initializers which has a telling name: they make it easy to create classes for example with predefined values. Write `convenience init` before defining it. 

```swift
class Vehicle {
    var model: String
    var year: Int
    
    init(model: String, year: Int) {
        self.model = model
        self.year = year
    }
    
    convenience init() {
        self.init(model: "Unknown", year: 1970)
    }
}

let car1 = Vehicle(model: "Tesla", year: 2023)
let car2 = Vehicle()  
```

It's also worth noting that if you provide a default value for a class variable, you don't need to include it in the initializer. If all properties have default values, Swift gives you a basic init method for free:

```swift
class Vehicle {
    var model: String = "Unknown"
    var year: Int = 1970
}

let car1 = Vehicle()
```

Classes can also have computed properties. 

```swift
class Student {
    var name: String
    var age: Int
    
    // computed property
    var grade: String {
        if age > 17 {
            return "Senior"
        }
        return "Junior"
    }

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }    
}
```

These are all instance-level properties, all tied to instances of a class. Classes can also define class-level properties (or type-properties), which are shared across all instances and belong to the class itself. 

```swift
class Animal {

    static var planet: String { "Earth" }

    class var sound: String { "Generic sound" }
}

class Dog: Animal {

    override class var sound: String { "Bark" }
}

print(Animal.planet) 
print(Animal.sound)  
print(Dog.sound)     
```

In summary, both keywords are used to define properties or methods that belong to the class itself, not to individual instances. The difference is in whether or not they allow overrides in subclasses.

Classes are reference types. For value types, a new copy is made each time you assign or pass a value. For reference types, no copies are made—multiple instances can share and point to the same data.

```swift
class Bike {
    var color: String

    init(color: String) {
        self.color = color
    }
}

var bike1 = Bike(color: "Blue")
var bike2 = bike1

bike1.color = "Red"

print(bike2.color)
```

Like structs, classes can also have functions, which are also called methods:

```swift
class Bike {

    var name: String

    init(name: String) {
        self.name = name
    }

    func honk() {
        print("Bip, bip.")
    }
}
```

That's pretty straightforward. Now, let's look at a more interesting example—one where we want to modify a class:

```swift
class Counter {
    var count = 0

    func increment() {  
        count += 1
    }
}
```

Classes, however, are reference types. Instances are shared, not copied. When you change an instance of a class, you are changing the same object in memory. That's why Swift doesn't require a special keyword like `mutating` for class methods—in fact, you can't even use it with classes.

Classes can conform to protocols just like structs. 

There is a way to limit a protocol to reference types only. This is done using `AnyObject`. Using `AnyObject` makes sure that only reference types can adopt the protocol:

```swift
protocol DataStore: AnyObject { 
    func save()
}

class Database: DataStore {
    
    func save() { 
        print("Saving to database...") 
    }
}
```

Other than this, all the things you've learned about protocols with struct examples in the previous chapters work very similarly with classes.
