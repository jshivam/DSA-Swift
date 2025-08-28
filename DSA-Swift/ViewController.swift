//
//  ViewController.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 02/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        EvaluateDivision().excecute()
    }
}


class Solution {
    class Node {
        var val: Int
        var neighbors: [Node?]
        
        init(_ val: Int) {
            self.val = val
            self.neighbors = []
        }
    }
    
    var visited: [Int: Node] = [:]
    
    func cloneGraph(_ node: Node?) -> Node? {

        guard let node = node else {
            return nil
        }
        
        if let visitedNode = visited[node.val] {
            return visitedNode
        }
        
        let clonedNode = Node(node.val)
        visited[node.val] = clonedNode

        for neighbor in node.neighbors {
            clonedNode.neighbors.append(cloneGraph(neighbor))
        }
        
        return clonedNode
    }
    
    func cloneGraphBSF(_ node: Node?) -> Node? {
        guard let node = node else { return nil }
                
        // Create the first clone
        let clone = Node(node.val)
        visited[node.val] = clone
        
        // BFS queue
        var queue: [Node] = [node]
        
        while !queue.isEmpty {
            let current = queue.removeFirst()
            
            for neighbor in current.neighbors {
                guard let neighbor = neighbor else { continue }
                
                if visited[neighbor.val] == nil {
                    // Clone the neighbor
                    visited[neighbor.val] = Node(neighbor.val)
                    queue.append(neighbor)
                }
                
                // Append the cloned neighbor to the cloned current node
                visited[current.val]?.neighbors.append(visited[neighbor.val])
            }
        }
        
        return clone
    }
}
