//
//  Find Peak Element.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 23/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit
/**
 A peak element is an element that is greater than its neighbors.

 Given an input array nums, where nums[i] ≠ nums[i+1], find a peak element and return its index.

 The array may contain multiple peaks, in that case return the index to any one of the peaks is fine.

 You may imagine that nums[-1] = nums[n] = -∞.

 Example 1:

     Input: nums = [1,2,3,1]
     Output: 2
     Explanation: 3 is a peak element and your function should return the index number 2.

 Example 2:

     Input: nums = [1,2,1,3,5,6,4]
     Output: 1 or 5
     Explanation: Your function can return either index number 1 where the peak element is 2, or index number 5 where the peak element is 6.
 Note:

 Your solution should be in logarithmic complexity.
*/
class Find_Peak_Element: Executable {

    func excecute() {
        print(findPeakElement([1,2,3,1]))
    }

    func findPeakElement(_ nums: [Int]) -> Int {

        var arra = nums
        arra.insert(Int.min, at: 0)
        arra.append(Int.min)

        var index = 1
        let range = 1..<(arra.count-1)
        while range.contains(index) {
            let prev = arra[index - 1]
            let next = arra[index + 1]
            let current = arra[index]
            if ((prev < current) && (current > next)) {
                return index - 1
            }
            index += 1
        }

        return index - 1
    }
}
