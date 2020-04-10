//
//  Heap.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 09/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

class Heap {
    var items = [Int]()

    func maxHeapify(_ index: Int) {
        guard !items.isEmpty, index < items.count else { return }
        let leftIndex = index * 2 + 1
        let rightIndex = index * 2 + 2
        var largestIndex = items[index]

        if leftIndex < items.count  && largestIndex < items[leftIndex] {
            largestIndex = leftIndex
        }

        if rightIndex < items.count && largestIndex < items[rightIndex] {
            largestIndex = rightIndex
        }

        if largestIndex != items[index] {
            items.swapAt(largestIndex, index)
            maxHeapify(largestIndex)
        }
    }

    func buildMaxHeap() {
        for index in stride(from: items.count/2, to: 0, by: -1) {
            maxHeapify(index)
        }
    }
}
