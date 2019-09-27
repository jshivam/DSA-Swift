//
//  MinimunDepth.swift
//  DSA
//
//  Created by Shivam Jaiswal on 24/09/19.
//  Copyright © 2019 Shivam Jaiswal. All rights reserved.
//

import Foundation

extension TreeNode
{
    func minDepth(_ root: TreeNode?) -> Int {
        
        guard let root = root else { return 0 }
        if root.left == nil && root.right == nil {
            return 1
        }
        
        if root.left == nil {
            return minDepth(root.right) + 1
        }

        if root.right == nil {
            return minDepth(root.left) + 1
        }
        
        return min(minDepth(root.left), minDepth(root.right)) + 1
    }
}
