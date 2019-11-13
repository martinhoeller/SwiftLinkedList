# SwiftLinkedList

A simple linked list implementation in Swift.

## Usage
Create a list, specifying the contained element type:
```
var list = LinkedList<String>()
```

Modify the list by appending, inserting or removing items:
```
let item1 = list.append("item1")
let item2 = list.append("item2")
let item3 = list.insert("item3", after: item2)
list.remove(item1)
```

`LinkedList` implements the `Sequence` and `IteraterProtocol` protocols, so fast enumeration is possible.
```
for item in list {
    ...
}
```

## Requirements
Built with Xcode 11.1, Swift 5.
