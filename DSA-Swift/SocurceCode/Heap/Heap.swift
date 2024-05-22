//
//  Heap.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 09/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

class Heap {
    private var items = [Int]()

    func maxHeapify(_ index: Int) {
        guard !items.isEmpty, index < items.count else { return }
        let leftIndex = index * 2 + 1
        let rightIndex = index * 2 + 2
        var largestIndex = index

        if leftIndex < items.count  && items[largestIndex] < items[leftIndex] {
            largestIndex = leftIndex
        }

        if rightIndex < items.count && items[largestIndex] < items[rightIndex] {
            largestIndex = rightIndex
        }

        if largestIndex != index {
            items.swapAt(largestIndex, index)
            maxHeapify(largestIndex)
        }
    }

    func buildMaxHeap() {
        items = [1, 2, 3, 4, 5]

        for heapIndex in stride(from: items.count/2  - 1, through: 0, by: -1) {
            maxHeapify(heapIndex)
        }
        
        print(items)
    }
}


struct Heap_DS<Element: Comparable> {
    private var elements: [Element] = []
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
    
    mutating func insert(_ element: Element) {
        elements.append(element)
        siftUp(from: elements.count - 1)
    }
    
    mutating func deleteMax() -> Element? {
        guard !isEmpty else { return nil }
        elements.swapAt(0, elements.count - 1)
        let maxElement = elements.removeLast()
        siftDown(from: 0)
        return maxElement
    }
    
    private mutating func siftUp(from index: Int) {
        var childIndex = index
        var parentIndex = parent(of: childIndex)
        
        while childIndex > 0 && elements[childIndex] > elements[parentIndex] {
            elements.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = parent(of: childIndex)
        }
    }
    
    private mutating func siftDown(from index: Int) {
        var parentIndex = index
        
        while true {
            let leftChildIndex = leftChild(of: parentIndex)
            let rightChildIndex = rightChild(of: parentIndex)
            var maxIndex = parentIndex
            
            if leftChildIndex < count && elements[leftChildIndex] > elements[maxIndex] {
                maxIndex = leftChildIndex
            }
            if rightChildIndex < count && elements[rightChildIndex] > elements[maxIndex] {
                maxIndex = rightChildIndex
            }
            if maxIndex == parentIndex {
                return
            }
            elements.swapAt(parentIndex, maxIndex)
            parentIndex = maxIndex
        }
    }
    
    private func parent(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    private func leftChild(of index: Int) -> Int {
        return 2 * index + 1
    }
    
    private func rightChild(of index: Int) -> Int {
        return 2 * index + 2
    }
}

// Example usage:
//var maxHeap = Heap_DS<Int>()
//maxHeap.insert(5)
//maxHeap.insert(3)
//maxHeap.insert(8)
//maxHeap.insert(1)
//
//print(maxHeap.deleteMax()!) // Output: 8
//print(maxHeap.deleteMax()!) // Output: 5
