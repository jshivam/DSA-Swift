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
        let nums = [1, 5, 11, 5]
        print(canPartition(nums))
    }
    
    func canPartition(_ nums: [Int]) -> Bool {
        var total = 0
        for item in nums {
            total += item
        }
        
        if total % 2 == 0 {
            var hashMap = [String : Bool]()
            return canPartitionUtil(nums, sum: 0, total: total, index: 0, hashMap: &hashMap)
        }
        
        return false
    }
    
    func canPartitionUtil(_ nums: [Int], sum: Int, total: Int, index: Int, hashMap: inout [String: Bool]) -> Bool {
        
        let key = "\(sum)_\(index)"
        if let canPartition = hashMap[key] {
            return canPartition
        }
        
        if sum * 2 == total {
            hashMap[key] = true
            return true
        }
        
        if sum > total/2 || index >= nums.count{
            hashMap[key] = false
            return false
        }
        
        let result = canPartitionUtil(nums, sum: sum, total: total, index: index + 1, hashMap: &hashMap) || canPartitionUtil(nums, sum: sum + nums[index], total: total, index: index + 1, hashMap: &hashMap)
        hashMap[key] = result
        
        return result
    }
}
