---
title: "Protocols"
description: ""
order: 31
---

A protocol is defined by the `protocol` keyword followed by the name, which conventionally starts with a capital letter. Protocol names usually describe a capability or a role.

```swift
protocol Vehicle {
    
    var name: String { get set }
    var mph: Double { get }
    
    func drive()
    func estimatedTime(for _: Double) -> Double
}
```

See a `Car` structs conforming to the `Vehicle` protocol:: 

```swift
struct Car: Vehicle {
    
    var name: String
    var mph: Double
    
    func drive() {
        print("Driving the \(name) at \(mph) mph.")
    }
    
    func estimatedTime(for distance: Double) -> Double {
        distance / mph
    }
}

```

Just like structs, enums can conform to protocols too. This means you require all instances of an enum to provide certain properties and methods as defined by the protocol. The implementation is a bit different of course:

```swift

enum Airplane: Vehicle {
    case boeing(name: String, mph: Double)
    case airbus(name: String, mph: Double)

    var name: String {
        get {
            switch self {
            case .boeing(let name, _), .airbus(let name, _):
                return name
            }
        }
        set {
            switch self {
            case .boeing(_, let mph):
                self = .boeing(name: newValue, mph: mph)
            case .airbus(_, let mph):
                self = .airbus(name: newValue, mph: mph)
            }
        }
    }

    var mph: Double {
        switch self {
        case .boeing(_, let mph), .airbus(_, let mph):
            return mph
        }
    }

    private var type: String {
        switch self {
        case .airbus(_, _): "Airbus"
        case .boeing(_, _): "Boeing"
        }
    }

    func drive() {
        print("Flying the \(type) \(name) at \(mph) mph.")
    }

    func estimatedTime(for distance: Double) -> Double {
        distance / mph
    }
}
```


When instances are created from struct `Car` and `Airplane` which both conform to `Vehicle` protocol, you can use the protocol as a type, by explicitly marking the `currentVehicle` as `Vehicle`:

```swift
var currentVehicle: Vehicle = Car(name: "Tesla", mph: 150)
currentVehicle.drive()
print(currentVehicle.estimatedTime(for: 6000))

currentVehicle = Airplane.boeing(name: "777-9", mph: 500)
currentVehicle.drive()
print(currentVehicle.estimatedTime(for: 6000))
```

By conforming to the same protocol, different types can be used interchangeably. In the snippet below, `vehicles` is a constant which holds an array of various types adapting `Vehicle`. Hence, these types can be stored together and processed in a uniform way: 

```swift
let vehicles: [Vehicle] = [
    // ...
]

let distanceToReach: Double = 6000

for vehicle in vehicles {
    let time = vehicle.estimatedTime(for: distanceToReach)
    print("Using a \(vehicle.name) it takes \(time) hours to travel \(distanceToReach) miles.")
}
```

Thanks to protocols as types, you can create an array that holds different kinds of vehicles. We can also use a protocol type as function parameters:

```swift
func goToTheCheckpoint(using vehicle: Vehicle) {
    vehicle.drive()
}

let car = Car(name: "Tesla", mph: 150)
goToTheCheckpoint(using: car)

let airplane = Airplane.boeing(name: "777-9", mph: 500)
goToTheCheckpoint(using: airplane)
```

Just like protocols can require properties or functions, they can also require initializers, asking conforming types to provide a specific way of initialization. To require an initializer, declare it like this:

```swift
protocol Identifiable {
    var id: String { get }

    init(id: String) 
}

struct User: Identifiable {
    var id: String
    
    init(id: String) {  
        self.id = id
    }
}

let user = User(id: "12345")  
```

What if you want to allow that initialization can fail? For example, maybe you only want to create an instance of `Adult` if it's `age` is above `18`. You can declare failable initializers with `init?` when initialization might fail:

```swift
protocol AgeRestricted {
    init?(age: Int)
}

struct Adult: AgeRestricted {
    var age: Int
    
    init?(age: Int) {
        guard age >= 18 else { return nil }
        self.age = age
    }
}

let adult = Adult(age: 20)
let minor = Adult(age: 16)
```

If you pass something under 18, initialization fails and `nil` is returned.
