//
//  Unique Paths.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 24/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit
/**
 A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).

 The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).

 How many possible unique paths are there?

 Example 1:

     Input: m = 3, n = 2

     Output: 3

    Explanation:
     From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
     1. Right -> Right -> Down
     2. Right -> Down -> Right
     3. Down -> Right -> Right

 Example 2:

     Input: m = 7, n = 3

     Output: 28

 Constraints:

 1 <= m, n <= 100
 It's guaranteed that the answer will be less than or equal to 2 * 10 ^ 9.
*/
class Unique_Paths: Executable {
    func excecute() {
        print(uniquePaths(7, 3))
    }

    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var dp = [Key : Int]()
        func uniquePathsUtil(_ R: Int, _ C: Int, _ row: Int, _ col: Int) -> Int {
            if let op = dp[Key(row: row, col: col)] { return op }
            guard row >= 0, col >= 0, row < R, col < C else { return 0 }
            let res = 1 + uniquePathsUtil(R, C, row + 1, col) + uniquePathsUtil(R, C, row, col + 1)
            dp[Key(row: row, col: col)] = res
            return res
        }
        return uniquePathsUtil(m - 1, n - 1, 0, 0) + 1
    }

    private struct Key: Hashable {
        let row: Int
        let col: Int
    }
}
