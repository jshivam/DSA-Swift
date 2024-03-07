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

         var leftIndex = 0
         var rightIndex = nums.endIndex - 1
         
         while leftIndex < rightIndex {
             let midIndex = (leftIndex + rightIndex) / 2

             let isGreaterThanPrev = midIndex == 0 ? true :  nums[midIndex] > nums[midIndex - 1]

             if ((isGreaterThanPrev) && (nums[midIndex] > nums[midIndex + 1]))  {
                 return midIndex
             }
             else if nums[midIndex] < nums[midIndex + 1] {
                 leftIndex = midIndex + 1
             }
             else {
                 rightIndex = midIndex - 1
             }
         }
        
         return leftIndex
     }
}
