//
//  LevelOrderTraversal.swift
//  DSA
//
//  Created by Shivam Jaiswal on 24/09/19.
//  Copyright © 2019 Shivam Jaiswal. All rights reserved.
//

import Foundation

extension TreeNode
{
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        
        guard let root = root else { return [] }
        
        let Q = Queue<TreeNode>()
        Q.enqueue(root)
        
        var result: [[Int]] = []
        
        while !Q.isEmpty{
            
            var nodes = [Int]()
            
            for _ in 0..<Q.size {
                
                let item = Q.dequeue()!
                nodes.append(item.val)

                if let left = item.left {
                    Q.enqueue(left)
                }
                if let right = item.right {
                    Q.enqueue(right)
                }
            }
            
            result.append(nodes)
        }
        return result
    }
}
