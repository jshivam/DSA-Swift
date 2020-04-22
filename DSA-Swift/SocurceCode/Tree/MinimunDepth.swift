//
//  MinimunDepth.swift
//  DSA
//
//  Created by Shivam Jaiswal on 24/09/19.
//  Copyright © 2019 Shivam Jaiswal. All rights reserved.
//

import Foundation

extension TreeNode{
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        if root.left == nil && root.right == nil {
            return 1
        }

        let left = root.left == nil ? Int.max : minDepth(root.left)
        let right = root.right == nil ? Int.max : minDepth(root.right)

        return min(left, right) + 1
    }
}
