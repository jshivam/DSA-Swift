//
//  VerticalOrderTraversal.swift
//  DSA
//
//  Created by Shivam Jaiswal on 24/09/19.
//  Copyright © 2019 Shivam Jaiswal. All rights reserved.
//

import Foundation

class DTreeNode {
    var distance = 0
    var node: TreeNode
    
    init(_ node: TreeNode) {
        self.node = node
    }
}

extension TreeNode
{
    func verticalTraversal(_ root: TreeNode?) -> [[Int]] {

        guard let root = root else { return [] }
        
        let Q = Queue<DTreeNode>()
        Q.enqueue(DTreeNode(root))
        
        var result: [Int: [Int]] = [Int: [Int]]()
        
        while !Q.isEmpty{
                        
            for _ in 0..<Q.size {
                
                let item = Q.dequeue()!
                var results = result[item.distance] ?? []
                results.append(item.node.val)
                result[item.distance] = results
                
                if let left = item.node.left {
                    let leftNode = DTreeNode(left)
                    leftNode.distance = item.distance - 1
                    Q.enqueue(leftNode)
                }
                
                if let right = item.node.right {
                    let rightNode = DTreeNode(right)
                    rightNode.distance = item.distance + 1
                    Q.enqueue(rightNode)
                }
            }
        }
        
        var output = [[Int]]()
        let keys = result.keys.sorted()
        for key in keys {
            output.append(result[key]!)
        }
        return output
    }
}
