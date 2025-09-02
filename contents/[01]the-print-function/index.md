---
title: "The print function"
description: "Learn how to use the Swift print function with simple examples. Display text, run code from the command line, and compile Swift programs step by step."
order: 1
---

The print function displays text or values on the screen. 

We can display messages on the command line using print, such as the famous "Hello, World!" text. To try it out, create a new file named main.swift and place the following Swift code inside:

```swift
print("Hello, World!")
```

The Swift toolchain is the complete set of tools — including the compiler, standard library, debugger, and package manager — that enables building, running, and testing Swift programs across platforms.

The `swift` command is included in the Swift toolchain. By running your program with the `swift` command, the compiler executes the code and displays the classic "Hello, World!" message:


```sh
swift main.swift
# Hello, world!
```

The Swift compiler is part of the Swift toolchain, and the `swiftc` command is used to compile Swift source files into executable binaries. You can start the compilation process by running the following command:

```sh
swiftc -o app main.swift
```

The `swiftc` command generates an `app` binary, which you can then execute directly from the command line like this:

```sh
./app
# Hello, world!
```
Now that we can build and run basic Swift programs, it’s time to dive deeper into the language and explore its core features.

