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
