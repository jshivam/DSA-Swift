//
//  FindKPairswithSmallestSums.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 27/07/25.
//  Copyright © 2025 Shivam Jaiswal. All rights reserved.
//

import Foundation

class FindKPairswithSmallestSums: Executable {
    func excecute() {
        print(kSmallestPairs(
            [1,7,11],
                                             
            [2,4,6],
            
            11)
        )
    }
        
    func kSmallestPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {
        guard !nums1.isEmpty && !nums2.isEmpty else { return [] }
        
        let minHeap = Heap<HeapItem>(ordering: .min)
        var result: [[Int]] = []
        var visited = Set<HeapItem>()
        
        // Start with the first pair
        let firstItem = HeapItem(value: nums1[0] + nums2[0], i: 0, j: 0)
        minHeap.insert(firstItem)
        visited.insert(firstItem)
        
        for _ in 0..<k {
            guard let current = minHeap.delete() else { break }
            
            result.append([nums1[current.i], nums2[current.j]])
            
            // Add next possible pairs
            let nextI = current.i + 1
            let nextJ = current.j + 1
            
            // Add pair with next element from nums1
            if nextI < nums1.count {
                let nextItem = HeapItem(value: nums1[nextI] + nums2[current.j], i: nextI, j: current.j)
                if !visited.contains(nextItem) {
                    minHeap.insert(nextItem)
                    visited.insert(nextItem)
                }
            }
            
            // Add pair with next element from nums2
            if nextJ < nums2.count {
                let nextItem = HeapItem(value: nums1[current.i] + nums2[nextJ], i: current.i, j: nextJ)
                if !visited.contains(nextItem) {
                    minHeap.insert(nextItem)
                    visited.insert(nextItem)
                }
            }
        }
        
        return result
    }
    
    struct HeapItem: Comparable, Hashable {
        let value: Int
        let i: Int
        let j: Int
        
        static func < (lhs: HeapItem, rhs: HeapItem) -> Bool {
            return lhs.value < rhs.value
        }
        
        static func == (lhs: HeapItem, rhs: HeapItem) -> Bool {
            return lhs.value == rhs.value && lhs.i == rhs.i && lhs.j == rhs.j
        }
    }
}
