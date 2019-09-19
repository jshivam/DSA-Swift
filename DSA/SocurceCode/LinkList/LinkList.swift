//
//  LinkList.swift
//  DSA
//
//  Created by Shivam Jaiswal on 19/09/19.
//  Copyright © 2019 Shivam Jaiswal. All rights reserved.
//

import Foundation

class ListNode<Element>
{
    var value: Element
    var next: ListNode?
    weak var prev: ListNode?
    init(_ value: Element) {
        self.value = value
    }
}

extension ListNode: CustomStringConvertible where Element: LosslessStringConvertible {
    var description: String {
        return String(value)
    }
}

class LinkList<T>
{
    public typealias Node = ListNode<T>
    private (set) lazy var iterator = head

    var head: Node? {
        didSet{
            iterator = self.head
        }
    }
    
    func append(_ item: T) {
        let node = ListNode(item)
        guard let head = head else {
            self.head = node
            return
        }
        var current = head
        while let next = current.next {
            current = next
        }
        current.next = node
    }
}

extension LinkList: CustomStringConvertible where T: LosslessStringConvertible
{
    var description: String {
        var current = self.head
        var description: String = current?.value.description ?? ""
        
        while let next = current?.next {
            current = next
            description.append("->\(next.value)")
        }
        description.insert("[", at: description.startIndex)
        description.insert("]", at: description.endIndex)
        return description
    }
}

extension LinkList: Sequence, IteratorProtocol
{
    func next() -> Node? {
        defer{
            iterator = iterator?.next
        }
        return iterator
    }
}

extension LinkList
{
    subscript (_ index: Int) -> Node {
        get{
            for (nodeIndex, node) in self.enumerated() where index == nodeIndex { return  node }
            fatalError("Index out of bounds!")
        }
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var size: Int {
        var count = 0
        for _ in self {
            count += 1
        }
        return count
    }
}
