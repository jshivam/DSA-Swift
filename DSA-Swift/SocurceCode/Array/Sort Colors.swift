//
//  Sort Colors.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 23/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit
/**
 Given an array with n objects colored red, white or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white and blue.

 Here, we will use the integers 0, 1, and 2 to represent the color red, white, and blue respectively.

 Note: You are not suppose to use the library's sort function for this problem.

 Example:

     Input: [2,0,2,1,1,0]
     Output: [0,0,1,1,2,2]

 Follow up:

 A rather straight forward solution is a two-pass algorithm using counting sort.
 First, iterate the array counting number of 0's, 1's, and 2's, then overwrite array with total number of 0's, then 1's and followed by 2's.
 Could you come up with a one-pass algorithm using only constant space?
*/

class Sort_Colors: Executable {
    func excecute() {
        var arr = [2,0,2,1,1,0]
        sortColors(&arr)
        print(arr)
    }

    func sortColors(_ nums: inout [Int]) {
        let index = sortColorsUtils(&nums, start: 0, valueOnLeft: 0)
        sortColorsUtils(&nums, start: index, valueOnLeft: 1)
    }

    @discardableResult
    private func sortColorsUtils(_ nums: inout [Int], start: Int, valueOnLeft: Int) -> Int {
        var leftIndex = start
        var rightIndex = nums.count - 1

        while leftIndex < rightIndex {
            let leftValue = nums[leftIndex]
            let rightValue = nums[rightIndex]

            if leftValue == valueOnLeft {
                leftIndex += 1
                continue
            }

            if rightValue != valueOnLeft {
                rightIndex -= 1
                continue
            }

            nums[leftIndex] = rightValue
            nums[rightIndex] = leftValue
        }

        return leftIndex
    }
}
