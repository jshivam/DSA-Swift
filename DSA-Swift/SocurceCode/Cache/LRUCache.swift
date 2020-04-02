//
//  LRUCache.swift
//  DSA
//
//  Created by Shivam Jaiswal on 28/03/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
///Users/shivamjaiswal/Development/DSA-Swift/DSA/SocurceCode/Cache/LRUCache.swift

/*
 5, 1, 2, 3, 4, 5
*/

import Foundation

class LRUCache<Key: Hashable> {
    let maxSize: Int
    private var size: Int = 0
    private var hashMap = [Key : DLL<Key,Any>.DLLNode]()
    private let list = DLL<Key,Any>()

    init(size: Int) {
        self.maxSize = size
    }

    func set(value: Any, for key: Key) {
        if let node = hashMap[key] {
            list.delete(node)
            hashMap[key] = list.append(value, for: key)
        } else {
            if size < maxSize  {
                hashMap[key] = list.append(value, for: key)
                size += 1
            } else {
                let node = list.dropFirst()!
                hashMap[node.key] = nil
                hashMap[key] = list.append(value, for: key)
            }
        }
    }

    func getValue(for key: Key) -> Any? {
        guard let node = hashMap[key] else { return nil }

        list.delete(node)
        hashMap[key] = list.append(node.value, for: key)
        return node.value
    }
}

private class DLL<Key, Value> {
    private(set) var head: DLLNode?
    private(set) var last: DLLNode?

    func append(_ item: Value, for key: Key) -> DLLNode {
        let node = DLLNode(key: key, value: item)
        if head == nil {
            head = node
            last = node
        } else {
            last?.next = node
            node.previous = last
            last = node
        }
        return node
    }

    func delete(_ node: DLLNode) {
        guard let head = head, let last = last else { return }

        if node === head && node === last {
            self.head = nil
            self.last = nil
        } else if node === head {
            dropFirst()
        } else if node === last {
            dropLast()
        } else {
            let prev = node.previous
            let next = node.next
            prev?.next = next
            next?.previous = prev
        }
    }

    @discardableResult
    func dropFirst() -> DLLNode? {
        let next = head?.next
        head?.next = nil
        defer { head = next }
        return head
    }

    @discardableResult
    func dropLast() -> DLLNode? {
        let prev = last?.previous
        last?.previous = nil
        defer { last = prev }
        return last
    }
}

extension DLL {
    class DLLNode {
        let key: Key
        var value: Value
        var next: DLLNode?
        weak var previous: DLLNode?

        init(key: Key, value: Value) {
            self.key = key
            self.value = value
        }
    }
}
