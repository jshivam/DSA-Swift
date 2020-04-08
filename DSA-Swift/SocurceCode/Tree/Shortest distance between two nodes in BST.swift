//
//  Shortest distance between two nodes in BST.swift
//  DSA
//
//  Created by Shivam Jaiswal on 18/10/19.
//  Copyright © 2019 Shivam Jaiswal. All rights reserved.
//

import Foundation

extension TreeNode {
    func shortestDistanceBST(_ root: TreeNode?, a: Int, b: Int) -> Int
    {
        guard let root = root else { return 0 }
        
        if root.value > a && root.value > b {
            return shortestDistanceBST(root.left, a: a, b: b)
        }
        
        if root.value < a && root.value < b {
            return shortestDistanceBST(root.right, a: a, b: b)
        }
        
        return distanceBetween(root, value: a) + distanceBetween(root, value: b)
    }
    
    private func distanceBetween(_ root: TreeNode?, value: Int) -> Int {
        guard let root = root else { return 0 }
        let nextNode = root.value > value ? root.left : root.right
        return 1 + distanceBetween(nextNode, value: value)
    }
}
