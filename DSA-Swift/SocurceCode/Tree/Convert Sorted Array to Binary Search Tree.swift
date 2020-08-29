//
//  Convert Sorted Array to Binary Search Tree.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 25/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

/**
 
 Given an array where elements are sorted in ascending order, convert it to a height balanced BST.

 For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.

 Example:

 Given the sorted array: [-10,-3,0,5,9],

 One possible answer is: [0,-3,9,-10,null,5], which represents the following height balanced BST:

       0
      / \
    -3   9
    /   /
  -10  5

*/

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
