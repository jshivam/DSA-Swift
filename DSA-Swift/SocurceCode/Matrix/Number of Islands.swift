//
//  Number of Islands.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 24/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

/**
 Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

 Example 1:

     1 1 1 1 0
     1 1 0 1 0
     1 1 0 0 0
     0 0 0 0 0

     Output: 1

 Example 2:

     1 1 0 0 0
     1 1 0 0 0
     0 0 1 0 0
     0 0 0 1 1

     Output: 3
*/
class Number_of_Islands: Executable {

    func excecute() {
        let matrix = [[1, 1, 1, 1, 0],
                      [1, 1, 0, 1, 0],
                      [1, 1, 0, 0, 0],
                      [0, 0, 0, 0, 0]]

        print(numIslands(matrix))
    }


    func numIslands(_ grid: [[Int]]) -> Int {
        var grid = grid
        var islands = 0
        for row in 0..<grid.count {
            for col in 0..<grid[row].count {
                if grid[row][col] == 1 {
                    islands += search(&grid, row, col)
                }
            }
        }
        return islands
    }

    @discardableResult
    private func search(_ grid: inout [[Int]], _ row: Int, _ col: Int) -> Int {
        guard row >= 0, col >= 0, row < grid.count, col < grid[row].count, grid[row][col] == 1 else { return 0 }
        grid[row][col] = 0
        search(&grid, row, col + 1)
        search(&grid, row, col - 1)
        search(&grid, row - 1, col)
        search(&grid, row + 1, col)
        return 1
    }
}
