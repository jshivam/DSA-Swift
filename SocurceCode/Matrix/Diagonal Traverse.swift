//
//  Diagonal Traverse.swift
//  DSA
//
//  Created by Shivam Jaiswal on 07/10/19.
//  Copyright © 2019 Shivam Jaiswal. All rights reserved.
//

import UIKit

class DiagonalTraverse: Executable {

    func excecute() {
        let matrix: [[Int]] = [
         [ 1, 2 ],
         [ 4, 5 ],
         [ 7, 8 ]
        ]
        
        print(findDiagonalOrder(matrix))
    }
    
    func findDiagonalOrder(_ matrix: [[Int]]) -> [Int]
    {
        guard let col = matrix.first?.count, !matrix.isEmpty, col > 0 else { return [] }
        let row = matrix.count
        var shouldGoUp = true
        
        let rowRange = 0..<row
        let colRange = 0..<col
        
        var c_row = 0
        var c_col = 0
        
        let size = row * col
        
        var result = Array(repeating: 0, count: size)

        for index in 0..<(row * col) {
            let item = matrix[c_row][c_col]
            result[index] = item
            
            if shouldGoUp
            {
                if rowRange.contains(c_row - 1) && colRange.contains(c_col + 1) {
                    c_row -= 1
                    c_col += 1
                }
                else{
                    shouldGoUp = false
                    if colRange.contains(c_col + 1) {
                        c_col += 1
                    }
                    else{
                        c_row += 1
                    }
                }
            }
            else
            {
                if colRange.contains(c_col - 1) && rowRange.contains(c_row + 1) {
                    c_col -= 1
                    c_row += 1
                }
                else{
                    shouldGoUp = true
                    if rowRange.contains(c_row + 1) {
                        c_row += 1
                    }
                    else{
                        c_col += 1
                    }
                }
            }
        }
        
        
        return result
    }
}
