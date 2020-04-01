//
//  Diameter of Binary Tree.swift
//  DSA
//
//  Created by Shivam Jaiswal on 01/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

extension TreeNode {
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        let leftHeight = height(root.left)
        let rightHeight = height(root.right)
        let diameter1 = leftHeight + rightHeight + 1

        let leftDiameter = diameterOfBinaryTree(root.left)
        let rightDiameter = diameterOfBinaryTree(root.right)

        return max(diameter1, max(leftDiameter, rightDiameter))
    }

    func height(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return max(height(root.left), height(root.right)) + 1
    }
}
