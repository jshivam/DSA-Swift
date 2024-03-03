//
//  Minimum Subarray With Required Sum.swift
//  DSA-Swift
//
//  Created by FitBudd on 03/03/24.
//  Copyright © 2024 Shivam Jaiswal. All rights reserved.
//

import UIKit

/**
 
 Given an array of positive integers nums and a positive integer target, return the minimal length of a subarray whose sum is greater than or equal to target. If there is no such subarray, return 0 instead.

 Example 1:

 Input: target = 7, nums = [2,3,1,2,4,3]
 Output: 2
 Explanation: The subarray [4,3] has the minimal length under the problem constraint.
 Example 2:

 Input: target = 4, nums = [1,4,4]
 Output: 1
 Example 3:

 Input: target = 11, nums = [1,1,1,1,1,1,1,1]
 Output: 0
 
**/


class Minimum_Subarray_With_Required_Sum: Executable {
    
    func excecute() {
        print(minSubArrayLen(7, [7,1]))
    }
    
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        
        guard !nums.isEmpty else { return 0 }
        
        var leftPointer = 0
        var rightPointer = 0
        var sum = 0
        var length = Int.max
        
        for (rightPointer, _) in nums.enumerated() {
            sum += nums[rightPointer]
            
            while sum >= target {
                let localLength = rightPointer - leftPointer + 1
                length = min(localLength, length)
                sum -= nums[leftPointer]
                leftPointer += 1
            }
        }
        
        length = length == Int.max ? 0 : length
        
        return length
    }
}
