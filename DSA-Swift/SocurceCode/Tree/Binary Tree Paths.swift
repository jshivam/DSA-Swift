//
//  Binary Tree Paths.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 08/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

/**
 Given a binary tree, return all root-to-leaf paths.

 Note: A leaf is a node with no children.

 Example:

 Input:

   1
  /   \
 2     3
  \
   5

 Output: ["1->2->5", "1->3"]

 Explanation: All root-to-leaf paths are: 1->2->5, 1->3
*/

extension TreeNode {
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        guard let root = root else { return [] }
        var paths = [String]()
        dfs(root,"", &paths)
        return paths
    }

    private func dfs(_ root: TreeNode?, _ path: String, _ paths: inout [String]) {
        guard let root = root else { return }

        let path = path + "\(root.val)"

        if isLeaf(root) {
            paths.append(path)
            return
        }

        dfs(root.left, path + "->", &paths)
        dfs(root.right, path + "->", &paths)
    }

    private func isLeaf(_ root: TreeNode?) -> Bool {
       guard let root = root else { return true }
       return root.left == nil && root.right == nil
    }
}

