//
//  Two Sum.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 22/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

/**
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.

 You may assume that each input would have exactly one solution, and you may not use the same element twice.

 Example:

        Given nums = [2, 7, 11, 15], target = 9,

        Because nums[0] + nums[1] = 2 + 7 = 9,

        return [0, 1].
*/

class Two_Sum: Executable {
    func excecute() {
        print(twoSum([2, 7, 11, 15], 9))
    }

    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map = [Int : Int]()
        for (index, item) in nums.enumerated() {
            let key = target - item
            guard let value = map[key], value != index  else {
                map[item] = index
                continue
            }
            return [index, value]
        }
        return []
    }
}
