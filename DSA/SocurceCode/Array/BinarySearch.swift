//
//  BinarySearch.swift
//  DSA
//
//  Created by Shivam Jaiswal on 24/09/19.
//  Copyright © 2019 Shivam Jaiswal. All rights reserved.
//

import Foundation

class BinarySearch: Executable
{
    func excecute() {
        let array = [1, 2, 4, 5, 9]
        let result = search(target: 15, on: array, start: 0, last: array.count - 1)
        print(result ?? -1)
    }
    
    func search<Element: Comparable>(target: Element, on array: [Element], start: Int, last: Int) -> Element? {
        var start = start
        var last = last
        
        while start < last
        {
            let midIndex = (last - start)/2 + start
            let mid = array[midIndex]
            
            if mid == target {
                return mid
            }
            
            if target < mid  {
                last = midIndex - 1
            }
            
            if target > mid {
                start = midIndex + 1
            }
        }
        return nil
    }
}
