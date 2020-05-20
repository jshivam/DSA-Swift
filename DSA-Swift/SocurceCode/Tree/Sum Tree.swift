//
//  Sum Tree.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 08/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

extension TreeNode {
    func isSumTree(_ root: TreeNode?) -> Bool {
        guard let root = root, !isLeaf(root) else { return true }
        let leftSum = sum(root.left)
        let rightSum = sum(root.right)
        let isValidSum = rightSum + leftSum == root.val
        return isValidSum && isSumTree(root.left) && isSumTree(root.right)
    }

    private func isLeaf(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        return root.left == nil && root.right == nil
    }

    func sum(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return root.val + sum(root.left) + sum(root.right)
    }
}

