//
//  Lowest Common Ancestor of a Binary Search Tree.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 24/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

extension Tree {
    
    static func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root, let q = q, let p = p else { return nil }

        if q.val < root.val && p.val < root.val {
            return lowestCommonAncestor(root.left, p, q)
        }

        if q.val > root.val && p.val > root.val {
            return lowestCommonAncestor(root.right, p, q)
        }

        return root
    }
}
