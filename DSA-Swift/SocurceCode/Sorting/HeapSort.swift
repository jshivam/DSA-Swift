//
//  HeapSort.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 26/07/25.
//  Copyright © 2025 Shivam Jaiswal. All rights reserved.
//

import Foundation

extension Sorter {
    func heapSort<T: Comparable>(_ array: inout [T], ascending: Bool = true) {
        guard array.count > 1 else { return }
        
        let n = array.count
        
        // Build max heap
        for i in stride(from: n / 2 - 1, through: 0, by: -1) {
            heapifyInPlace(&array, n, i, ascending: ascending)
        }
        
        // Extract elements from heap one by one
        for i in stride(from: n - 1, through: 1, by: -1) {
            array.swapAt(0, i)
            heapifyInPlace(&array, i, 0, ascending: ascending)
        }
    }

    private func heapifyInPlace<T: Comparable>(_ array: inout [T], _ heapSize: Int, _ rootIndex: Int, ascending: Bool) {
        var largest = rootIndex
        let leftChild = 2 * rootIndex + 1
        let rightChild = 2 * rootIndex + 2
        
        // For ascending sort, we use max heap logic
        // For descending sort, we use min heap logic
        if ascending {
            if leftChild < heapSize && array[leftChild] > array[largest] {
                largest = leftChild
            }
            
            if rightChild < heapSize && array[rightChild] > array[largest] {
                largest = rightChild
            }
        } else {
            if leftChild < heapSize && array[leftChild] < array[largest] {
                largest = leftChild
            }
            
            if rightChild < heapSize && array[rightChild] < array[largest] {
                largest = rightChild
            }
        }
        
        if largest != rootIndex {
            array.swapAt(rootIndex, largest)
            heapifyInPlace(&array, heapSize, largest, ascending: ascending)
        }
    }
}

