//
//  Spiral Matrix.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 22/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

class Spiral_Matrix: Executable {

    func excecute() {
        print(spiralOrder([
         [ 1, 2, 3 ],
         [ 4, 5, 6 ],
         [ 7, 8, 9 ]
        ]))
    }

    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var R_S = 0
        var R_E = matrix.count - 1
        var C_S = 0
        var C_E = (matrix.first?.count ?? 0) - 1
        var result = [Int]()
        while ((R_S <= R_E) && (C_S <= C_E))
        {
            guard C_S <= C_E else { break }
            for col in C_S...C_E {
                result.append(matrix[R_S][col])
            }
            R_S += 1

            guard R_S <= R_E else { break }
            for row in R_S...R_E {
                result.append(matrix[row][C_E])
            }
            C_E -= 1

            guard C_S <= C_E else { break }
            for col in stride(from: C_E, through: C_S , by: -1) {
                result.append(matrix[R_E][col])
            }
            R_E -= 1

            guard R_S <= R_E else { break }
            for row in stride(from: R_E, through: R_S , by: -1) {
                result.append(matrix[row][C_S])
            }
            C_S += 1
        }
        return result
    }
}
