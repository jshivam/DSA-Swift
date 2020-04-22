//
//  Set Matrix Zeroes.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 22/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

/**
 Given a m x n matrix, if an element is 0, set its entire row and column to 0. Do it in-place.

 Example 1:

     Input:
     [
       [1,1,1],
       [1,0,1],
       [1,1,1]
     ]
     Output:
     [
       [1,0,1],
       [0,0,0],
       [1,0,1]
     ]

 Example 2:

     Input:
     [
       [0,1,2,0],
       [3,4,5,2],
       [1,3,1,5]
     ]
     Output:
     [
       [0,0,0,0],
       [0,4,5,0],
       [0,3,1,0]
     ]

 Follow up:

 A straight forward solution using O(mn) space is probably a bad idea.
 A simple improvement uses O(m + n) space, but still not the best solution.
 Could you devise a constant space solution?
*/

class Set_Matrix_Zeroes: Executable {

    func excecute() {
        var mat = [
          [1,1,1],
          [1,0,1],
          [1,1,1]
        ]
        print(setZeroes(&mat))
    }

    func setZeroes(_ matrix: inout [[Int]]) {
        let rowSize = matrix.count
        let colSize = matrix.first?.count ?? 0
        var visited: [Point2D : Bool] = [:]

        func markAllZero(row: Int, col: Int)
        {
            for i in 0..<rowSize {
                let val = matrix[i][col]
                if val != 0 {
                    matrix[i][col] = 0
                    visited[Point2D.init(first: i, second: col)] = true
                }
            }

            for j in 0..<colSize {
                let val = matrix[row][j]
                if val != 0 {
                    matrix[row][j] = 0
                    visited[Point2D.init(first: row, second: j)] = true
                }
            }
        }

        for i in 0..<rowSize {
            for j in 0..<colSize {
                let item = matrix[i][j]
                if item == 0 {
                    let point = Point2D.init(first: i, second: j)
                    if visited[point] == nil {
                        markAllZero(row: i, col: j)
                    }
                }
            }
        }
    }

    struct Point2D: Hashable {
        let first: Int
        let second: Int

        func hash(into hasher: inout Hasher) {
            hasher.combine(self.first)
            hasher.combine(self.second)
        }

        static func ==(lhs: Point2D, rhs: Point2D) -> Bool {
            return lhs.first == rhs.first && lhs.second == rhs.second
        }
    }
}
