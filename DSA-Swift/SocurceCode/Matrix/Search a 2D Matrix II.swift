//
//  Search a 2D Matrix II.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 23/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

/**
 Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:

 Integers in each row are sorted in ascending from left to right.
 Integers in each column are sorted in ascending from top to bottom.
 Example:

 Consider the following matrix:

     [
       [1,   4,  7, 11, 15],
       [2,   5,  8, 12, 19],
       [3,   6,  9, 16, 22],
       [10, 13, 14, 17, 24],
       [18, 21, 23, 26, 30]
     ]

 Given target = 5, return true.

 Given target = 20, return false.
*/

class Search_a_2D_Matrix_II: Executable {

    func excecute() {
        let matrix = [
          [1,   4,  7, 11, 15],
          [2,   5,  8, 12, 19],
          [3,   6,  9, 16, 22],
          [10, 13, 14, 17, 24],
          [18, 21, 23, 26, 30]
        ]
        print(searchMatrix(matrix, 3))
    }

    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {

        let colSize = matrix.first?.count ?? 0
        let rowSize = matrix.count

        var row = 0
        var col = colSize - 1

        while (row < rowSize) && (col >= 0)
        {
            let currentItem = matrix[row][col]
            if target > currentItem {
                row += 1
            }else if target < currentItem{
                col -= 1
            }else{
                return true
            }
        }
        return false
    }
}
