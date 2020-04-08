//
//  Lowest Common Ancestor of a Binary Tree.swift
//  DSA
//
//  Created by Shivam Jaiswal on 18/10/19.
//  Copyright © 2019 Shivam Jaiswal. All rights reserved.
//

import Foundation

extension TreeNode
{
    func LCA(_ root: TreeNode?, value1: Int, value2: Int) -> TreeNode? {
        
        guard let root = root else { return nil }
        
        if root.val == value1 || root.val == value2 {
            return root
        }
        
        let left = LCA(root.left, value1: value1, value2: value2)
        let right = LCA(root.right, value1: value1, value2: value2)
        if let _ = left, let _ = right {
            return root
        }
        
        if let _ = left {
            return left
        }
        
        if let _ = right {
            return right
        }
        
        return nil
    }
}
