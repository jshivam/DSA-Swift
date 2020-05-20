//
//  Subarray Sum Equals K.swift
//  DSA
//
//  Created by Shivam Jaiswal on 01/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//
//https://www.youtube.com/watch?v=AmlVSNBHzJg

import UIKit
/**
 Given an array of integers and an integer k, you need to find the total number of continuous subarrays whose sum equals to k.

 Example 1:

     Input:nums = [1,1,1], k = 2
     Output: 2
*/
class SubarraySumEqualsK: Executable {
    func excecute() {
        print(subarraySum([10, 2, -2, -20, 10],  -10))
    }

    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var hashMap = [Int : Int]()
        var result = 0
        var sum = 0
        hashMap[0] = 1

        for item in nums {
            sum += item
            if let count = hashMap[sum - k], count > 0 {
                result += count
            }
            hashMap[sum, default: 0] += 1
        }

        return result
    }
}
