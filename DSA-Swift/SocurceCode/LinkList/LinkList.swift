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

// MARK: - LinkList
class LinkList<T>
{
    typealias Node = ListNode<T>
    private lazy var iterator = head

    private(set) var head: Node? {
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
    
    func insert(_ item: T, at _index: Int) {
        
        let newNode = Node(item)
        for (index, node) in self.enumerated() where index == _index {
            let temp = node.value
            node.value = newNode.value
            newNode.value = temp
            
            newNode.next = node.next
            node.next = newNode
            return
        }
        fatalError("Index out of bouds!")
    }
    
    @discardableResult
    func remove(at index: Int) -> T? {
        
        let node = self[index]
        let temp = node.next
        node.next = temp?.next
        defer {
            if let value = temp?.value {
                node.value = value
            }
        }
        return node.value
    }
    
    @discardableResult
    func removeFirst() -> T? {
        
        defer {
            head = head?.next
        }
        return head?.value
    }
}

extension LinkList: CustomStringConvertible
{
    var description: String {
        
        guard var current = self.head else { return "" }
        var description: String = "\(current.value)"
        
        while let next = current.next {
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

extension LinkList: Equatable where T: Equatable
{
    static func == (lhs: LinkList<T>, rhs: LinkList<T>) -> Bool {
        var rhsNode = rhs.head
        for lhsNode in lhs {
            guard let _rhsNode = rhsNode, lhsNode.value == _rhsNode.value else { return false }
            rhsNode = _rhsNode.next
        }
        return rhsNode == nil
    }
}

extension LinkList: Comparable where T: Comparable
{
    static func < (lhs: LinkList<T>, rhs: LinkList<T>) -> Bool {
        var rhsNode = rhs.head
        for lhsNode in lhs {
            guard let _rhsNode = rhsNode, lhsNode.value < _rhsNode.value else { return false }
            rhsNode = _rhsNode.next
        }
        return true
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
    
    func reverseRecursively(){
        head = reversed(head)
    }

    func reverseList(){
        head = reverseList(head)
    }

    private func reversed(_ head: Node?) -> Node? {

        if head?.next == nil {
            return head
        }
        
        let rest = reversed(head?.next)
        head?.next?.next = head
        head?.next = nil
        
        return rest
    }
    
    private func reverseList(_ head: Node?) -> Node?
    {
        var current: Node? = head
        var next: Node? = head?.next
        var prev: Node?  = nil
        
        while next != nil
        {
            current?.next = prev
            prev = current
            current = next
            next = current?.next
        }
        
        current?.next = prev
        return current
    }
}

extension LinkList where T: Comparable {
    func sort() {
        head = sortList(head)
    }
    
    private func sortList(_ head: Node?) -> Node? {
        guard let head = head, head.next != nil else {
            return head
        }
        
        let (left, right) = splitList(head)
        
        return mergeLists(sortList(left), sortList(right))
    }
    
    private func splitList(_ head: Node) -> (Node, Node?) {
        var slow = head
        var fast = head
        
        // Find middle using two pointers
        while fast.next != nil && fast.next?.next != nil {
            slow = slow.next!
            fast = fast.next!.next!
        }
        
        // Split the list
        let rightHalf = slow.next
        slow.next = nil
        
        return (head, rightHalf)
    }
    
    private func mergeLists(_ list1: Node?, _ list2: Node?) -> Node? {
        var dummy: Node?
        var current = dummy
        var l1 = list1
        var l2 = list2
        
        // Merge while both lists have nodes
        while let node1 = l1, let node2 = l2 {
            if dummy == nil {
                if node1.value <= node2.value {
                    dummy = node1
                    l1 = node1.next
                }
                else {
                    dummy = node2
                    l2 = node2.next
                }
                current = dummy
                continue
            }
            else if node1.value <= node2.value{
                current!.next = node1
                l1 = node1.next
            } else {
                current!.next = node2
                l2 = node2.next
            }
            current = current?.next!
        }
        
        // Attach remaining nodes
        current!.next = l1 ?? l2
        
        return dummy!
    }
}
