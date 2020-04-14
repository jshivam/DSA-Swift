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
        permute([1, 2, 3]).forEach({ print($0) })
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
}
