---
title: "Ownership"
description: "Use ~Copyable for non-copyable types, and understand consume, borrowing, and inout modifiers for safe resource management."
order: 34
---

Swift has a **~Copyable** protocol, which makes an entity "non-copyable." By default, Swift automatically adds the Copyable protocol to value types. By adding **~Copyable** you can suppress the implicit conformance to the Copyable protocol.

```swift
struct FileHandleWrapper: ~Copyable {
    let path: String

    init(path: String) {
        self.path = path
        print("Opening file handle")
    }

    func write(_ text: String) {
        print("Writing text to \(path)")
    }

    deinit {
        print("Closing file handle")
    }
}
```

Non-copyable types usually represent resources that shouldn't be duplicated, like file handles, unique tokens, or network connections. 

```swift
func main() {
    let file1 = FileHandleWrapper(
        path: "test.txt", 
        mode: "w"
    )
    let file2 = file1 // file1 is consumed here
    // file1 can no longer be used
}
main()
```
The **consume** modifier allows us to end the lifetime of a variable — take full ownership and invalidate the original. Let's see an example in which there's a consuming modifier used with a non-copyable type: 

```swift
func close(
    file: consuming FileHandleWrapper
) {
    // file is consumed here; cannot be used after this call
}

close(file: file1)

// print(file1) // not possible to use file1 anymore
```

The **borrowing** modifier grants temporary read-only access. The original value remains usable after the function call, the function cannot consume the parameter in any way:

```swift
func preview(
    file: borrowing FileHandleWrapper
) {
    // file is borrowed; can read or inspect, but not consume
    // file is still valid after this call
}

preview(file: file1)

print(file1) // this is still fine
```

Let's compare Swift's ownership modifiers with a complete example:

```swift
enum ResourceStatus: ~Copyable {
    case available
    case inUse
    case released
}

// function using `inout` to modify the enum in place
func updateStatus(
    _ status: inout ResourceStatus
) {
    status = .inUse // modifies the original value
}

// function borrowing the enum (read-only access)
func checkStatus(
    _ status: borrowing ResourceStatus
) {
    switch status {
    case .available:
        print("Resource is available.")
    case .inUse:
        print("Resource is in use.")
    case .released:
        print("Resource has been released.")
    }
}

// function consuming an enum (takes ownership)
func releaseResource(
    _ status: consuming ResourceStatus
) {
    print("Releasing resource...")

    // `status` is fully consumed here and cannot be used afterward.
}

func main() {
    var status = ResourceStatus.available

    checkStatus(status)     // Borrowing - allows reuse
    updateStatus(&status)   // `inout` - modifies the value in place
    checkStatus(status)     // Check updated status
    releaseResource(status) // Consuming - ownership taken
    // print(status)        // Not possible after consuming
}
main()
```

Understanding ownership and modifiers in Swift helps you write safer, more predictable code when working with resources that should not be duplicated or misused.
