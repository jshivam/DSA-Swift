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
        let max_single = max(max(left, right) + root.value, root.value)
        let max_top = max(max_single, left + right + root.value)
        sum = max(sum, max_top)
        return max_single
    }
}
