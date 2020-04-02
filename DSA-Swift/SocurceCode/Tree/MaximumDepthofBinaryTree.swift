//
//  MaximumDepthofBinaryTree.swift
//  DSA
//
//  Created by Shivam Jaiswal on 01/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

extension Tree {

    static func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        let leftDepth = maxDepth(root.left) + 1
        let rightDepth = maxDepth(root.right) + 1

        return max(leftDepth, rightDepth)
    }
}
