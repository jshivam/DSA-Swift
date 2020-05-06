//
//  Convert Sorted Array to Binary Search Tree.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 25/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

extension Tree {
    static func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        if nums.isEmpty { return nil }

        func helper(_ nums: [Int], _ low: Int, _ high: Int) -> TreeNode? {
            if low > high {
                return nil
            }

            let middle = (low + high) / 2
            let node = TreeNode(nums[middle])
            node.left = helper(nums, low, middle - 1)
            node.right = helper(nums, middle + 1, high)

            return node
        }
        return helper(nums, 0, nums.count - 1)
    }
}
