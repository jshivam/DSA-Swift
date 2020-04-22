//
//  File.swift
//  DSA
//
//  Created by Shivam Jaiswal on 05/10/19.
//  Copyright © 2019 Shivam Jaiswal. All rights reserved.
//

import Foundation

extension TreeNode {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var result = 0
        var count = k
        kthSmallestUtil(root, &count, &result)
        return result
    }
    
    private func kthSmallestUtil(_ root: TreeNode?, _ count: inout Int, _ result: inout Int) {
        guard let root = root, count > 0 else { return }
        
        kthSmallestUtil(root.left, &count, &result)
        count -= 1

        if count == 0{
            result = root.val
            return
        }
        
        kthSmallestUtil(root.right, &count, &result)
    }
}

