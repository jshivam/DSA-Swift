//
//  Shortest distance between two nodes in BST.swift
//  DSA
//
//  Created by Shivam Jaiswal on 18/10/19.
//  Copyright © 2019 Shivam Jaiswal. All rights reserved.
//

import Foundation

extension TreeNode {
    /**
     Input: root = [4,2,6,1,3,null,null]
     Output: 1
     Explanation:
     Note that root is a TreeNode object, not an array.

     The given tree [4,2,6,1,3,null,null] is represented by the following diagram:

               4
             /   \
           2      6
          / \
         1   3

     while the minimum difference in this tree is 1, it occurs between node 1 and node 2, also between node 3 and node 2.
    */

    func shortestDistanceBST(_ root: TreeNode?, a: Int, b: Int) -> Int {
        guard let root = root else { return 0 }
        
        if root.val > a && root.val > b {
            return shortestDistanceBST(root.left, a: a, b: b)
        }
        
        if root.val < a && root.val < b {
            return shortestDistanceBST(root.right, a: a, b: b)
        }
        
        return distanceBetween(root, value: a) + distanceBetween(root, value: b)
    }
    
    private func distanceBetween(_ root: TreeNode?, value: Int) -> Int {
        guard let root = root else { return 0 }
        let nextNode = root.val > value ? root.left : root.right
        return 1 + distanceBetween(nextNode, value: value)
    }
}
