//
//  EvaluateDivision.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 28/08/25.
//  Copyright © 2025 Shivam Jaiswal. All rights reserved.
//

import Foundation

class EvaluateDivision: Executable {
    
    func execute() {
        print(
            calcEquation(
                [["a","b"],["b","c"]],
                [2.0,3.0],
                [["a","c"],["b","a"],["a","e"],["a","a"],["x","x"]]
            )
        )
    }
        
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        var graph: [String: [(node: String, weight: Double)]] = [:]
        var result: [Double] = []
        
        // Build graph
        for (equation, value) in zip(equations, values) {
            let (from, to) = (equation[0], equation[1])
            graph[from, default: []].append((to, value))
            graph[to, default: []].append((from, 1.0 / value))
        }
        
        // Process queries
        for query in queries {
            let (from, to) = (query[0], query[1])
            
            if graph[from] == nil || graph[to] == nil {
                result.append(-1.0)
                continue
            }
            
            var visited: Set<String> = []
            var queue: [(String, Double)] = [(from, 1.0)]
            var found = false
            
            // BFS
            outerLoop: while !queue.isEmpty {
                let (node, currentWeight) = queue.removeFirst()
                
                if node == to {
                    result.append(currentWeight)
                    found = true
                    break outerLoop
                }
                
                if visited.contains(node) { continue }
                visited.insert(node)
                
                for neighbour in graph[node] ?? [] {
                    queue.append((neighbour.node, currentWeight * neighbour.weight))
                }
            }
            
            if !found {
                result.append(-1.0)
            }
        }
        
        return result
    }
}
