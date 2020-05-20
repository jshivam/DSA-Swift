//
//  Minimum Swaps To Sort An Array.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 16/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

/**
 You are given an unordered array consisting of consecutive integers  `[1, 2, 3, ..., n]` without any duplicates. You are allowed to swap any two elements. You need to find the minimum number of swaps required to sort the array in ascending order.

 For example, given the array  we perform the following steps:

         i   [0, 1, 2, 3, 4, 5, 6]   swap (indices)
        --------------------------------------------
         0   [7, 1, 3, 2, 4, 5, 6]   swap (0,3)

         1   [2, 1, 3, 7, 4, 5, 6]   swap (0,1)

         2   [1, 2, 3, 7, 4, 5, 6]   swap (3,4)

         3   [1, 2, 3, 4, 7, 5, 6]   swap (4,5)

         4   [1, 2, 3, 4, 5, 7, 6]   swap (5,6)

         5   [1, 2, 3, 4, 5, 6, 7]
*/

class Minimum_Swaps_To_Sort_An_Array: Executable {
    func excecute() {
        print(minimumSwaps(arr: [4 ,3 ,1 ,2]))
    }

    func minimumSwaps(arr: [Int]) -> Int {
        var hashMap = [Int : Int]()
        var visited = Array(repeating: false, count: arr.endIndex + 1)
        for (index, item) in arr.enumerated() {
            hashMap[item] = index + 1
        }

        var swaps = 0
        for pos in 1..<arr.endIndex {
            if !visited[pos] {
                visited[pos] = true

                if pos != hashMap[pos] {
                    var temp = hashMap[pos]!
                    while visited[temp] == false {
                        visited[temp] = true
                        swaps += 1
                        temp = hashMap[temp]!
                    }
                }
            }
        }

        return swaps
    }
}
