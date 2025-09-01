---
title: "The print function"
description: ""
order: 1
---

The print function displays text or values on the screen. In the simplest form it means we can display messages on the command line. Create a new file named `main.swift` and place the following Swift code inside the file:

```swift
// FILE: main.swift

print("Hello, World!")

/**
Run Swift files using the command line:

$ swift main.swift
> Hello, World!
*/
```

Run the program via the `swift main.swift` command, it will display the `Hello, World!` message. 

---

```sh
# run the swift file
swift main.swift
# Hello, world!

# build the program
swiftc -o app main.swift
# run the program
./app
# Hello, world!
```