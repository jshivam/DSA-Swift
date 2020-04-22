//
//  Longest Increasing Subsequence.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 22/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

class Longest_Increasing_Subsequence: Executable {

    func excecute() {
        print(lengthOfLIS([10,9,2,5,3,7,101,18]))
    }

    func lengthOfLIS(_ nums: [Int]) -> Int {

        if nums.isEmpty {
            return 0
        }

        if nums.count == 1 {
            return 1
        }

        var allLIS = Array(repeating: 1, count: nums.count)

        for i in 1..<nums.count
        {
            for j in 0..<i
            {
                if nums[i] > nums[j] {
                    let lis = allLIS[j] + 1
                    if lis > allLIS[i] {
                        allLIS[i] = lis
                    }
                }
            }
        }

        return allLIS.max()!
    }
}
