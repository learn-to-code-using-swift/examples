---
title: "Unsafe memory"
description: ""
order: 35
---

There are 8 types of unsafe pointers in Swift: 

- `UnsafePointer<T>`
- `UnsafeMutablePointer<T>`
- `UnsafeRawPointer`
- `UnsafeMutableRawPointer`
- `UnsafeBufferPointer<T>`
- `UnsafeMutableBufferPointer<T>`
- `UnsafeRawBufferPointer`
- `UnsafeMutableRawBufferPointer`

Let's have a closer look at them:

```swift
var x: Int = 20
var xPointer: UnsafeMutablePointer<Int> = .init(&x)

print("x address:", UnsafeRawPointer(&x));
print("x value:", x);
print("pointer address:", UnsafeRawPointer(&xPointer));
print("pointer reference:", xPointer);
print("pointer reference value:", xPointer.pointee);

xPointer.pointee = 420;
print("x value:", x);
print("pointer reference value:", xPointer.pointee);

x = 69;
print("x value:", x);
print("pointer reference value:", xPointer.pointee);
```

This is a classic C pointer example, but we skipped looking at the C syntax and getting it translated to Swift. 

When working with unsafe pointers in Swift, it's you in charge of allocating and freeing memory — it's either manually touching memory or enjoying automatic memory management but not both at the same time. 

```swift
let numbers = [4, 8, 15, 16, 23, 42]

let pointer = UnsafeMutablePointer<Int>.allocate(capacity: numbers.count)
pointer.initialize(repeating: 0, count: numbers.count)
defer {
    pointer.deinitialize(count: numbers.count)
    pointer.deallocate()
}

for (index, value) in numbers.enumerated() {
    pointer.advanced(by: index).pointee = value
}

print(pointer.advanced(by: 5).pointee); //42

let bufferPointer = UnsafeBufferPointer(start: pointer, count: numbers.count) // UnsafeBufferPointer<Int>
for (index, value) in bufferPointer.enumerated() {
    print(index, "-", value)
}

/// change values using a mutable buffer pointer
let bufferPointer = UnsafeMutableBufferPointer(start: pointer, count: numbers.count)
for (index, _) in bufferPointer.enumerated() {
    bufferPointer[index] = index + 1
}
```

Typed pointers are the somewhat safer ones to work with, but how do we work with raw pointers? 

We're going to see how to allocate and free raw memory manually, also, how to store and use values as bytes in memory. We will use MemoryLayout to calculate how much memory we need, and see the significance of alignment and stride properties in practice. 

```swift
let numbers = [4, 8, 15, 16, 23, 42]

let stride = MemoryLayout<Int>.stride
let alignment = MemoryLayout<Int>.alignment
let byteCount = stride * numbers.count

let pointer = UnsafeMutableRawPointer.allocate(byteCount: byteCount, alignment: alignment)
defer {
    pointer.deallocate()
}
  
for (index, value) in numbers.enumerated() {
    pointer.advanced(by: stride * index).storeBytes(of: value, as: Int.self)
}
  
//print(pointer.advanced(by: stride * 5).load(as: Int.self)) // 42

let bufferPointer = UnsafeRawBufferPointer(start: pointer, count: byteCount)
for index in 0..<numbers.count {
    let value = bufferPointer.load(fromByteOffset: stride * index, as: Int.self)
    print(index, "-", value)
}
```

This next example demonstrates advanced memory management, especially how to allocate raw memory and bind it to a type.

```swift
let stride = MemoryLayout<Int>.stride
let alignment = MemoryLayout<Int>.alignment
let count = 1
let byteCount = stride * count

let rawPointer = UnsafeMutableRawPointer.allocate(byteCount: byteCount, alignment: alignment)
defer {
    rawPointer.deallocate()
}
let pointer = rawPointer.bindMemory(to: Int.self, capacity: count)
//let pointer = rawPointer.assumingMemoryBound(to: Int.self)
pointer.initialize(repeating: 0, count: count)
defer {
    pointer.deinitialize(count: count)
}

pointer.pointee = 42
print(rawPointer.load(as: Int.self))
rawPointer.storeBytes(of: 69, toByteOffset: 0, as: Int.self)
print(pointer.pointee)
```

Working with pointers in Swift is considered unsafe memory management. You should exercise caution when using these functions, as improper handling can lead to memory leaks, undefined behavior, or crashes. Always ensure you allocate, initialize, and deallocate memory correctly to maintain program stability and safety.
