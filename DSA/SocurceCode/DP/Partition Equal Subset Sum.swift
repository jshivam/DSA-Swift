//
//  Partition Equal Subset Sum.swift
//  DSA
//
//  Created by Shivam Jaiswal on 21/10/19.
//  Copyright © 2019 Shivam Jaiswal. All rights reserved.
//

import Foundation

class PartitionEqualSubsetSum: Executable {
    func excecute() {
        let nums = [67,95,58,76,19,60,20,17,23,23,67,85,8,67,81,65,73,92,59,97,45,94,26,90,70,45,24,52,25,43,2,83,15,25,66,87,77,11,46,75,46,59,17,84,11,64,9,74,65,78,85,3,87,81,67,37,79,50,14,88,55,45,58,31,75,74,13,2,60,51,94,82,63,90,25,60,86,12,42,78,33,8,50,84,86,71,46,47,15,86,56,64,8,26,34,21,21,24,49,16]
        print(canPartitionDP(nums))
    }
    
    func canPartition(_ nums: [Int]) -> Bool {
        let total = nums.reduce(0){$0 + $1}
        var hashMap = [String : Bool]()
        return total % 2 == 0 ? canPartitionUtil(nums: nums, index: 0, sum: 0, total: total, hashMap: &hashMap) : false
    }

    private func canPartitionUtil(nums: [Int], index: Int, sum: Int, total: Int, hashMap: inout [String : Bool]) -> Bool {
        let key = "\(sum)_\(index)"
        if let canPartition = hashMap[key] {
            return canPartition
        }

        if sum == total/2 {
            hashMap[key] = true
            return true
        }

        if sum > total/2 || index >= nums.count {
            hashMap[key] = false
            return false
        }

        // decide between to pick the element or not to pick
        let doNotPick = canPartitionUtil(nums: nums, index: index + 1, sum: sum, total: total, hashMap: &hashMap)
        let toPick = canPartitionUtil(nums: nums, index: index + 1, sum: sum + nums[index], total: total, hashMap: &hashMap)

        let result = doNotPick || toPick
        hashMap[key] = result
        return result
    }

    func canPartitionDP(_ nums: [Int]) -> Bool {
        let total = nums.reduce(0){$0 + $1}
        if total % 2 == 1 { return false }
        var dp = Array(repeating: false, count: total/2 + 1)
        dp[0] = true
        for num in nums {
            for item in stride(from: total/2, to: 0, by: -1) where item - num >= 0 {
                dp[item] = dp[item] || dp[item - num]
            }
        }
        return dp[total/2]
    }
}
