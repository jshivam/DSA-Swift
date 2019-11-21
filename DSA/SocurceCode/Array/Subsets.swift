//
//  Subsets.swift
//  DSA
//
//  Created by Shivam Jaiswal on 21/10/19.
//  Copyright © 2019 Shivam Jaiswal. All rights reserved.
//

import UIKit

class Subsets: Executable {

    func excecute() {
        let nums = [1,2,3]
        print(subsets(nums))
    }
    
    func subsets(_ nums: [Int]) -> [[Int]]
    {
        var subsets = [[Int]]()
        let last = Int(pow(2, Double(nums.count)))
        for number in 0..<last {
            var subset = [Int]()
            var num = number
            var index = 0
            while num != 0
            {
                if (num & 1) == 1{
                    subset.append(nums[index])
                }
                num = num >> 1
                index += 1
            }
            subsets.append(subset)
        }
        return subsets
    }
}
