//
//  TicTacToe.swift
//  DSA-Swift
//
//  Created by FitBudd on 17/05/24.
//  Copyright © 2024 Shivam Jaiswal. All rights reserved.
//

import Foundation

class TicTacToe {
    private let boardSize: Int
    private var rows: [Int]
    private var cols: [Int]
    private var diagonalSize = 0
    private var antiDiagonalSize = 0

    init(_ n: Int) {
        self.boardSize = n
        rows = Array(repeating: 0, count: n)
        cols = Array(repeating: 0, count: n)
    }
    
    func move(_ row: Int, _ col: Int, _ player: Int) -> Int {
        let playerCode = player == 1 ? 1 : -1
        
        rows[row] += playerCode
        cols[col] += playerCode
        
        if row == col {
            diagonalSize += playerCode
        }
        
        if row + col == boardSize - 1 {
            antiDiagonalSize += playerCode
        }
        
        if  abs(diagonalSize) == boardSize ||
            abs(antiDiagonalSize) == boardSize ||
            abs(rows[row]) == boardSize ||
            abs(cols[col]) == boardSize {
            return playerCode == 1 ? 1 : 2
        }
        
        return 0
    }
}
