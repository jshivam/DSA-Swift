//
//  SurroundedRegions.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 23/06/25.
//  Copyright © 2025 Shivam Jaiswal. All rights reserved.
//

import Foundation

/**
 You are given an m x n matrix board containing letters 'X' and 'O', capture regions that are surrounded:

 Connect: A cell is connected to adjacent cells horizontally or vertically.
 Region: To form a region connect every 'O' cell.
 Surround: The region is surrounded with 'X' cells if you can connect the region with 'X' cells and none of the region cells are on the edge of the board.
 To capture a surrounded region, replace all 'O's with 'X's in-place within the original board. You do not need to return anything.

 Example 1:
 Input: board =
        
        [
            ["X","X","X","X"],
            ["X","O","O","X"],
            ["X","X","O","X"],
            ["X","O","X","X"]
        ]

 Output:
 
        [
            ["X","X","X","X"],
            ["X","X","X","X"],
            ["X","X","X","X"],
            ["X","O","X","X"]
        ]
*/

class SurroundedRegions: Executable {
 
    func excecute() {
        var board: [[Character]] = [["O","X","O","O","O","X"],
                                    ["O","O","X","X","X","O"],
                                    ["X","X","X","X","X","O"],
                                    ["O","O","O","O","X","X"],
                                    ["X","X","O","O","X","O"],
                                    ["O","O","X","X","X","X"]]
        solve(&board)
        for row in board {
            print(row)
        }
    }
    
    func solve(_ board: inout [[Character]]) {
        guard !board.isEmpty && !board[0].isEmpty else { return }
        
        let rows = board.count
        let cols = board[0].count
        
        // Step 1: Mark all 'O' cells connected to border as safe (temporarily mark as 'S')
        // Check first and last rows
        for col in 0..<cols {
            if board[0][col] == "O" {
                dfs(&board, 0, col)
            }
            if board[rows-1][col] == "O" {
                dfs(&board, rows-1, col)
            }
        }
        
        // Check first and last columns
        for row in 0..<rows {
            if board[row][0] == "O" {
                dfs(&board, row, 0)
            }
            if board[row][cols-1] == "O" {
                dfs(&board, row, cols-1)
            }
        }
        
        // Step 2: Process the board
        for row in 0..<rows {
            for col in 0..<cols {
                if board[row][col] == "O" {
                    // This 'O' is not connected to border, so capture it
                    board[row][col] = "X"
                } else if board[row][col] == "S" {
                    // This was marked as safe, restore to 'O'
                    board[row][col] = "O"
                }
            }
        }
    }
    
    func dfs(_ board: inout [[Character]], _ row: Int, _ col: Int) {
        // Check bounds
        guard row >= 0, row < board.count, col >= 0, col < board[0].count else {
            return
        }
        
        // Only process 'O' cells
        guard board[row][col] == "O" else {
            return
        }
        
        // Mark as safe (connected to border)
        board[row][col] = "S"
        
        // Explore all 4 directions
        dfs(&board, row - 1, col)  // up
        dfs(&board, row + 1, col)  // down
        dfs(&board, row, col - 1)  // left
        dfs(&board, row, col + 1)  // right
    }
}
