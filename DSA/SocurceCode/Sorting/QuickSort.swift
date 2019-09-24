//
//  QuickSort.swift
//  DSA
//
//  Created by Shivam Jaiswal on 20/09/19.
//  Copyright © 2019 Shivam Jaiswal. All rights reserved.
//

import UIKit

class QuickSort<Element: Comparable>: Executable
{
    private var items: [Element]
    
    init(items: [Element]) {
        self.items = items
    }
    
    func excecute()
    {
        quicksort(&items, left: 0, right: items.count - 1)
        print(items)
    }
    
    private func quicksort(_ array: inout [Element], left: Int, right: Int)
    {
        if left >= right {
            return
        }
        
        let pivotIndex = (left + right)/2
        let partionIndex = partion(&array, left: left, right: right, pivot: pivotIndex)
        quicksort(&array, left: left, right: (partionIndex - 1))
        quicksort(&array, left: (partionIndex + 1), right: right)
    }
    
    private func partion(_ array: inout [Element], left: Int, right: Int, pivot: Int) -> Int
    {
        var left = left
        var right = right
        
        while left < right
        {
            if array[left] < array[pivot] {
                left += 1
                continue
            }
            
            if array[right] > array[pivot] {
                right -= 1
                continue
            }
            
            swap(&array, left: left, right: right)
            left += 1
            right = 1
        }
        return left
    }
    
    private func swap(_ array: inout [Element], left: Int, right: Int) {
        let temp = array[left]
        array[left] = array[right]
        array[right] = temp
    }
}
