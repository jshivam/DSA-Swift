//
//  QuickSort.swift
//  DSA
//
//  Created by Shivam Jaiswal on 20/09/19.
//  Copyright © 2019 Shivam Jaiswal. All rights reserved.
//

import UIKit

extension Sorter {
    func quickSort(_ items: inout [Item], left: Int, right: Int) {
        guard left < right else { return }
        let partionIndex = partion(&items, left: left, right: right )
        quickSort(&items, left: left, right: partionIndex - 1)
        quickSort(&items, left: partionIndex + 1, right: right)
    }

    private func partion(_ array: inout [Item], left: Int, right: Int) -> Int {
        let pivot = array[(left + right)/2]
        var left = left
        var right = right

        while left < right {
            if array[left] < pivot {
                left += 1
                continue
            }

            if array[right] > pivot {
                right -= 1
                continue
            }

            if array[left] == array[right] {
                right -= 1
            }

            array.swapAt(left, right)
        }
        return right
    }

}
