//
//  Jump Game.swift
//  DSA
//
//  Created by Shivam Jaiswal on 28/11/19.
//  Copyright © 2019 Shivam Jaiswal. All rights reserved.
//

import UIKit
/**
 Given an array of non-negative integers, you are initially positioned at the first index of the array. Each element in the array represents your maximum jump length at that position. Your goal is to reach the last index in the minimum number of jumps.

 Example:

     Input: [2,3,1,1,4]
     Output: 2
     Explanation: The minimum number of jumps to reach the last index is 2.
     Jump 1 step from index 0 to 1, then 3 steps to the last index.
*/
class Jump_Game: Executable {

    func excecute() {
        print(jump([7,0,9,6,9,6,1,7,9,0,1,2,9,0,3]))
    }

    func jump(_ nums: [Int]) -> Int {
        guard nums.count > 1, let first = nums.first, first != 0 else { return 0 }

        var ladder = nums[0]
        var stairs = nums[0]
        var jumps = 1

        for level in 1..<nums.count {

            if level == nums.count - 1 {
                return jumps
            }

            if ladder < level + nums[level] {
                ladder = level + nums[level]
            }

            stairs -= 1

            if stairs == 0 {
                stairs = ladder - level
                jumps += 1
            }
        }

        return jumps
    }
}
