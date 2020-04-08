//
//  Recover Binary Search Tree.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 08/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit
//[3,1,4,null,null,2]
extension Tree {
    static func recoverTree(_ root: TreeNode?) {
        var start: TreeNode? = nil
        var end: TreeNode? = nil
        var prev: TreeNode? = nil
        func recoverTreeUtil(_ root: TreeNode?) {
            guard let root = root else { return }
            recoverTreeUtil(root.left)
            if let prev = prev, prev.val >= root.val {
                if start == nil { start = prev }
                end = root
            }
            prev = root
            recoverTreeUtil(root.right)
        }

        recoverTreeUtil(root)
        guard let startNode = start, let endNode = end else { return }
        let temp = startNode.val
        startNode.val = endNode.val
        endNode.val = temp
    }
}
