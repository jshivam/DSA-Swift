//
//  Maximum Subarray.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 22/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

/**
 Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

 Example:

     Input: [-2,1,-3,4,-1,2,1,-5,4],
     Output: 6
     Explanation: [4,-1,2,1] has the largest sum = 6.

 Follow up:

 If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.
*/
class Maximum_Subarray: Executable {

    func excecute() {
        print(maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))
    }

    func maxSubArray(_ nums: [Int]) -> Int {
        var sum = 0
        var currentSum = 0

        for item in nums
        {
            currentSum += item
            if currentSum < 0 {
                currentSum = 0
            }

            if sum < currentSum{
                sum = currentSum
            }
        }

        if sum == 0 {
            return nums.max()!
        }

        return sum
    }
}
