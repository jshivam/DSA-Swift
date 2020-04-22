//
//  MaximumPathSum.swift
//  DSA
//
//  Created by Shivam Jaiswal on 24/09/19.
//  Copyright © 2019 Shivam Jaiswal. All rights reserved.
//

import Foundation

extension TreeNode
{
    /**
     Given a non-empty binary tree, find the maximum path sum.

     For this problem, a path is defined as any sequence of nodes from some starting node to any node in the tree along the parent-child connections. The path must contain at least one node and does not need to go through the root.

     Example 1:

     Input: [1,2,3]

            1
           / \
          2   3

     Output: 6
     Example 2:

     Input: [-10,9,20,null,null,15,7]

            -10
            / \
           9  20
             /  \
            15   7

     Output: 42
    */
    func maxPathSum(_ root: TreeNode?) -> Int
    {
        var sum = Int.min
        maxPathSumUtil(root, sum: &sum)
        return sum
    }
    
    @discardableResult
    fileprivate func maxPathSumUtil(_ root: TreeNode?, sum: inout Int) -> Int
    {
        guard let root = root else { return 0 }
        let left = maxPathSumUtil(root.left, sum: &sum)
        let right = maxPathSumUtil(root.right, sum: &sum)
        let max_single = max(max(left, right) + root.val, root.val)
        let max_top = max(max_single, left + right + root.val)
        sum = max(sum, max_top)
        return max_single
    }
}
