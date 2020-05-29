//
//  3Sum Smaller.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 29/05/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit
/**
 Count triplets with sum smaller than a given value
 Given an array of distinct integers and a sum value. Find count of triplets with sum smaller than given sum value. Expected Time Complexity is O(n2).

 Examples:

     Input : arr[] = {-2, 0, 1, 3} ; sum = 2.
     Output : 2
     Explanation :  Below are triplets with sum less than 2
                    (-2, 0, 1) and (-2, 0, 3)

     Input : arr[] = {5, 1, 3, 4, 7} ; sum = 12.
     Output : 4
     Explanation :  Below are triplets with sum less than 12
                    (1, 3, 4), (1, 3, 5), (1, 3, 7) and
                    (1, 4, 5)
*/
class Three_Sum_Smaller: Executable {
    func excecute() {
        print(threeSum([5, 1, 3, 4, 7], sum: 12))
    }

    func threeSum(_ nums: [Int], sum: Int) -> Int {
        guard nums.count > 3 else { return 1 }
        var result = 0
        let nums = nums.sorted()

        for i in 0..<nums.count - 2 {
            var j = i + 1
            var k = nums.count - 1

            while j < k {
                if nums[i] + nums[j] + nums[k] < sum {
                    result += (k - j)
                    j += 1
                } else {
                    k -= 1
                }
            }
        }
        return result
    }
}
