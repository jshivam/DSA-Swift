//
//  House Robber.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 05/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

class House_Robber: Executable {
    func excecute() {
        print(rob([1,2,3,1]))
    }

    func rob(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        guard nums.count != 1 else { return nums[0] }
        guard nums.count != 2 else { return max(nums[0], nums[1]) }
        var dp = Array(repeating: 0, count: nums.count)
        dp[0] = nums[0]
        dp[1] = max(nums[0], nums[1])
        for index in 2..<nums.count {
            dp[index] = max(dp[index - 2] + nums[index], dp[index - 1])
        }
        return dp[nums.count - 1]
    }
}
