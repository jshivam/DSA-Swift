//
//  Heap.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 09/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

class Heap<T: Comparable> {
    enum HeapOrdering {
        case min
        case max
    }
    
    let ordering: HeapOrdering
    private(set) var items: [T]

    init(ordering: HeapOrdering, items: [T] = []) {
        self.ordering = ordering
        self.items = items
        buildHeap()
    }
    
    func insert(_ element: T) {
        if items.isEmpty {
            items.append(element)
        }
        else {
            items.append(element)
            shiftUp(size - 1)
        }
    }
    
    @discardableResult
    func delete() -> T? {
        if items.isEmpty {
            return nil
        }
        else if items.count == 1 {
            return items.removeLast()
        }
        else {
            items.swapAt(0, items.count - 1)
            let item = items.removeLast()
            heapify(0)
            return item
        }
    }
    
    func isEmpty() -> Bool {
        return items.isEmpty
    }
    
    var size: Int {
        return items.count
    }
    
    private func shiftUp(_ index: Int) {
        var childIndex = index
        var parentIndex = self.parentIndex(childIndex)
        
        while childIndex > 0 && items[childIndex] > items[parentIndex] {
            items.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = self.parentIndex(childIndex)
        }
    }
    
    private func heapify(_ index: Int) {
        let leftChildIndex = leftChildIndex(index)
        let rightChildIndex = rightChildIndex(index)
        
        var largestIndex = index
        
        if leftChildIndex < size, items[leftChildIndex] > items[largestIndex] {
            largestIndex = leftChildIndex
        }
        
        if rightChildIndex < size, items[rightChildIndex] > items[largestIndex] {
            largestIndex = rightChildIndex
        }
        
        if largestIndex != index {
            items.swapAt(index, largestIndex)
            heapify(largestIndex)
        }
     }
    
    private func buildHeap() {
        for i in stride(from: size / 2 - 1, through: 0, by: -1) {
            heapify(i)
        }
    }
    
    private func parentIndex(_ index: Int) -> Int {
        return (index - 1) / 2
    }
    
    private func leftChildIndex(_ index: Int) -> Int {
        return 2 * index + 1
    }
    
    private func rightChildIndex(_ index: Int) -> Int {
        return 2 * index + 2
    }
}
