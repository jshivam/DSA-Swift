//
//  Permutations.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 15/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

class Permutations: Executable {
    func excecute() {
        permute2([1, 2, 3, 4]).forEach({ print($0) })
    }

    func permute<T>(_ nums: [T]) -> [[T]] {
        var result = [[T]]()

        func permuteUtil(_ nums: inout [T], _ n: Int) {
            guard n > 0 else { result.append(nums); return }
            permuteUtil(&nums, n - 1)
            for index in 0..<n {
                nums.swapAt(index, n)
                permuteUtil(&nums, n - 1)
                nums.swapAt(index, n)
            }
        }
        var nums = nums
        permuteUtil(&nums, nums.count - 1)
        return result
    }
    
    func permute2(_ nums: [Int]) -> [[Int]] {
        
        var permuteResult = [[Int]]()
        var numbers = nums
        
        if numbers.count <= 1 {
            permuteResult.append(numbers)
            return permuteResult
        }
        else {
            var res = [[Int]]()
            for index in 0..<numbers.count {
                let value = numbers[index]
                numbers.swapAt(0, index)
                let subarray = Array(numbers[1..<numbers.count])
                numbers.swapAt(0, index)
                let temp = permute2(subarray)
                for var item in temp {
                    item.append(value)
                    res.append(item)
                }
            }
            return res
        }
    }
}
