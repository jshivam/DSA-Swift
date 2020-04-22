//
//  Diameter of Binary Tree.swift
//  DSA
//
//  Created by Shivam Jaiswal on 01/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit
/**
 Given a binary tree, you need to compute the length of the diameter of the tree. The diameter of a binary tree is the length of the longest path between any two nodes in a tree. This path may or may not pass through the root.

 Example:
 Given a binary tree
           1
          / \
         2   3
        / \
       4   5
 Return 3, which is the length of the path [4,2,1,3] or [5,2,1,3].

 Note: The length of path between two nodes is represented by the number of edges between them.
*/
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
