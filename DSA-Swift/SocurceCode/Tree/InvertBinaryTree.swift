//
//  InvertBinaryTree.swift
//  DSA
//
//  Created by Shivam Jaiswal on 28/09/19.
//  Copyright © 2019 Shivam Jaiswal. All rights reserved.
//

import Foundation

extension TreeNode
{
    @discardableResult
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {return nil}
        
        invertTree(root.left)
        
        let temp = root.left
        root.left = root.right
        root.right = temp
        
        invertTree(root.left)
        
        return root
    }
}
