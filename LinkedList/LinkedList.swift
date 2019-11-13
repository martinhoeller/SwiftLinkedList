import Foundation

class LinkedList<T> {
    class Item<T> {
        let value: T

        var next: Item<T>?

        init(value: T) {
            self.value = value
        }
    }

    var first: Item<T>?
    var last: Item<T>?

    var isEmpty: Bool {
        return first == nil
    }

    @discardableResult
    func append(value: T) -> Item<T> {
        let item = Item<T>(value: value)

        if first == nil {
            first = item
            last = item
        } else {
            last?.next = item
            last? = item
        }

        return item
    }

    @discardableResult
    func insert(value: T, after predecessor: Item<T>) -> Item<T> {
        let item = Item<T>(value: value)

        let next = predecessor.next
        predecessor.next = item
        item.next = next

        return item
    }

    func remove(item: Item<T>) {
        // need to iterate from the beginning to find its predecessor
        var currentItem = first
        while currentItem != nil {
            if currentItem?.next === item {
                currentItem?.next = item.next
                break
            }
            currentItem = currentItem?.next
        }
    }
}

// MARK: - Sequence and Iterator conformance

extension LinkedList: Sequence {
    func makeIterator() -> LinkedListIterator<T> {
        return LinkedListIterator(self)
    }
}

class LinkedListIterator<T>: IteratorProtocol {
    typealias Element = LinkedList<T>.Item<T>

    private let linkedList: LinkedList<T>
    private var currentItem: Element?

    init(_ linkedList: LinkedList<T>) {
        self.linkedList = linkedList
        currentItem = linkedList.first
    }

    func next() -> Element? {
        let item = currentItem
        currentItem = item?.next
        return item
    }
}

// MARK: - Debug Descriptions

extension LinkedList.Item: CustomDebugStringConvertible {
    var debugDescription: String {
        return "ListItem(value: \(value), \(next == nil ? "is last" : "has successor"))"
    }
}

extension LinkedList: CustomDebugStringConvertible {
    var debugDescription: String {
        if isEmpty {
            return "<empty list>"
        }

        var description = ""

        var item = first
        while item != nil {
            description += " -> \(item?.debugDescription ?? "")"
            item = item?.next
        }

        return description
    }
}
