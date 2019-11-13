import Foundation

var list = LinkedList<String>()

print("Adding 3 items")
list.append(value: "1")
let i2 = list.append(value: "2")
list.append(value: "3")
print(list)

print("---------------------------------------------")
print("Adding an item in between others")
list.insert(value: "2.5", after: i2)
print(list)

print("---------------------------------------------")

print("Removing an item")
list.remove(item: i2)
print(list)

print("---------------------------------------------")

print("Iterating the list")
for item in list {
    print(item)
}

print("Iterating an empty list")
for item in LinkedList<String>() {
    print(item)
}

print("---------------------------------------------")
