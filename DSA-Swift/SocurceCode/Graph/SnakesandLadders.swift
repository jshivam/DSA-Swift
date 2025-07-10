//
//  SnakesandLadders.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 10/07/25.
//  Copyright © 2025 Shivam Jaiswal. All rights reserved.
//

import Foundation
/**
 
 You are given an n x n integer matrix board where the cells are labeled from 1 to n2 in a Boustrophedon style starting from the bottom left of the board (i.e. board[n - 1][0]) and alternating direction each row.

 You start on square 1 of the board. In each move, starting from square curr, do the following:

 Choose a destination square next with a label in the range [curr + 1, min(curr + 6, n2)].
 This choice simulates the result of a standard 6-sided die roll: i.e., there are always at most 6 destinations, regardless of the size of the board.
 If next has a snake or ladder, you must move to the destination of that snake or ladder. Otherwise, you move to next.
 The game ends when you reach the square n2.
 A board square on row r and column c has a snake or ladder if board[r][c] != -1. The destination of that snake or ladder is board[r][c]. Squares 1 and n2 are not the starting points of any snake or ladder.

 Note that you only take a snake or ladder at most once per dice roll. If the destination to a snake or ladder is the start of another snake or ladder, you do not follow the subsequent snake or ladder.

 For example, suppose the board is [[-1,4],[-1,3]], and on the first move, your destination square is 2. You follow the ladder to square 3, but do not follow the subsequent ladder to 4.
 Return the least number of dice rolls required to reach the square n2. If it is not possible to reach the square, return -1.

  

 Example 1:


        Input: board = [[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,35,-1,-1,13,-1],[-1,-1,-1,-1,-1,-1],[-1,15,-1,-1,-1,-1]]
        Output: 4
 
 Explanation:
 In the beginning, you start at square 1 (at row 5, column 0).
 You decide to move to square 2 and must take the ladder to square 15.
 You then decide to move to square 17 and must take the snake to square 13.
 You then decide to move to square 14 and must take the ladder to square 35.
 You then decide to move to square 36, ending the game.
 This is the lowest possible number of moves to reach the last square, so return 4.
 Example 2:

        Input: board = [[-1,-1],[-1,3]]
        Output: 1

 
*/

class SnakesandLadders: Executable {
    
    func excecute() {
        print(snakesAndLadders(
            [[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,35,-1,-1,13,-1],[-1,-1,-1,-1,-1,-1],[-1,15,-1,-1,-1,-1]]
        ))
    }

    func snakesAndLadders(_ board: [[Int]]) -> Int {
        let Q = Queue()
        Q.enqueue(1)
        var visited: Set<Cell> = []
        let size = board.count
        
        var steps = 0
        while !Q.isEmpty {
            let qSize = Q.size
            for _ in 0..<qSize {
                let currentNum = Q.dequeue()!
                
                if currentNum == size * size {
                    return steps
                }
                
                
                for diceRoll in 1...6 {
                    let nextNum = currentNum + diceRoll
                    
                    if nextNum > size * size {
                        break
                    }
                    
                    let (row, col) = cellIndexFor(nextNum, size)
                    let cell = Cell(row: row, col: col)
                    if visited.contains(cell){
                        continue
                    }
                    
                    visited.insert(cell)
                    
                    if board[row][col] == -1 {
                        Q.enqueue(nextNum)
                    }
                    else {
                        Q.enqueue(board[row][col])
                    }
                }
                
            }
            steps += 1
        }
        
        return -1
    }

    func cellIndexFor(_ num: Int, _ size: Int) -> (row: Int, col: Int) {
        let rowFromTop = (num - 1) / size
        let rowFromBottom = size - rowFromTop - 1
        var col = (num - 1) % size
        
        if rowFromBottom % 2 == size % 2 {
            col = size - col - 1
        }
        
        return (rowFromBottom, col)
    }
    
    class Queue {
        private var data: [Int] = []

        func enqueue(_ item: Int) {
            data.append(item)
        }

        func dequeue() -> Int? {
            return data.removeFirst()
        }

        var size: Int {
            return data.count
        }
        
        var isEmpty: Bool {
            return data.isEmpty
        }
    }
    
    struct Cell: Hashable {
        let row: Int
        let col: Int
    }
}

