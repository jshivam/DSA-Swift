//
//  ConstructQuadTree.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 31/07/25.
//  Copyright © 2025 Shivam Jaiswal. All rights reserved.
//

import Foundation
/**
 Given a n * n matrix grid of 0's and 1's only. We want to represent grid with a Quad-Tree.

 Return the root of the Quad-Tree representing grid.

 A Quad-Tree is a tree data structure in which each internal node has exactly four children. Besides, each node has two attributes:

 val: True if the node represents a grid of 1's or False if the node represents a grid of 0's. Notice that you can assign the val to True or False when isLeaf is False, and both are accepted in the answer.
 isLeaf: True if the node is a leaf node on the tree or False if the node has four children.
 class Node {
     public boolean val;
     public boolean isLeaf;
     public Node topLeft;
     public Node topRight;
     public Node bottomLeft;
     public Node bottomRight;
 }
 We can construct a Quad-Tree from a two-dimensional area using the following steps:

 If the current grid has the same value (i.e all 1's or all 0's) set isLeaf True and set val to the value of the grid and set the four children to Null and stop.
 If the current grid has different values, set isLeaf to False and set val to any value and divide the current grid into four sub-grids as shown in the photo.
 Recurse for each of the children with the proper sub-grid.

 If you want to know more about the Quad-Tree, you can refer to the wiki.

 Quad-Tree format:

 You don't need to read this section for solving the problem. This is only if you want to understand the output format here. The output represents the serialized format of a Quad-Tree using level order traversal, where null signifies a path terminator where no node exists below.

 It is very similar to the serialization of the binary tree. The only difference is that the node is represented as a list [isLeaf, val].

 If the value of isLeaf or val is True we represent it as 1 in the list [isLeaf, val] and if the value of isLeaf or val is False we represent it as 0.

  

     Example 1:


     Input: grid = [[0,1],[1,0]]
     Output: [[0,1],[1,0],[1,1],[1,1],[1,0]]
     Explanation: The explanation of this example is shown below:
     Notice that 0 represents False and 1 represents True in the photo representing the Quad-Tree.

     Example 2:



     Input: grid = [[1,1,1,1,0,0,0,0],[1,1,1,1,0,0,0,0],[1,1,1,1,1,1,1,1],[1,1,1,1,1,1,1,1],[1,1,1,1,0,0,0,0],[1,1,1,1,0,0,0,0],[1,1,1,1,0,0,0,0],[1,1,1,1,0,0,0,0]]
     Output: [[0,1],[1,1],[0,1],[1,1],[1,0],null,null,null,null,[1,0],[1,0],[1,1],[1,1]]
     Explanation: All values in the grid are not the same. We divide the grid into four sub-grids.
     The topLeft, bottomLeft and bottomRight each has the same value.
     The topRight have different values so we divide it into 4 sub-grids where each has the same value.
     Explanation is shown in the photo below:

  

 Constraints:

 n == grid.length == grid[i].length
 n == 2x where 0 <= x <= 6
*/

class QuadTree {
    var root: Node?

    func construct(_ grid: [[Int]]) -> Node? {
        guard grid.count > 1 else { return nil }
        
        root = Node(grid[0][0] == 1, false)
        
        let _grid = Grid(grid: grid, rowStart: 0, rowEnd: grid.count - 1, colStart: 0, colEnd: grid[0].count - 1)
        
        if allSameValue(_grid) {
            root?.isLeaf = true
            return root
        }
        
        return constructHelper(_grid, root)
    }
    
    func constructHelper(_ grid: Grid, _ root: Node?) -> Node? {
        
        let quadrants = getFourQuadrants(grid)
        
        if allSameValue(quadrants.tl) {
            root?.topLeft = Node(quadrants.tl.firstBool, true)
        }
        else {
            root?.topLeft = constructHelper(quadrants.tl, Node(false, false))
        }
        
        if allSameValue(quadrants.tr) {
            root?.topRight = Node(quadrants.tr.firstBool, true)
        }
        else {
            root?.topRight = constructHelper(quadrants.tr, Node(false, false))
        }
        
        if allSameValue(quadrants.bl) {
            root?.bottomLeft = Node(quadrants.bl.firstBool, true)
        }
        else {
            root?.bottomLeft = constructHelper(quadrants.bl, Node(false, false))
        }
        
        if allSameValue(quadrants.br) {
            root?.bottomRight = Node(quadrants.br.firstBool, true)
        }
        else {
            root?.bottomRight = constructHelper(quadrants.br, Node(false, false))
        }
        
        
        return root
    }
    
    private func getFourQuadrants(_ grid: Grid) -> (tl: Grid, tr: Grid, bl: Grid, br: Grid) {
        let midRow = (grid.rowStart + grid.rowEnd) / 2
        let midCol = (grid.colStart + grid.colEnd) / 2
        
        let tlGrid = Grid(grid: grid.grid, rowStart: grid.rowStart, rowEnd: midRow, colStart: grid.colStart, colEnd: midCol)
        let trGrid = Grid(grid: grid.grid, rowStart: grid.rowStart, rowEnd: midRow, colStart: midCol + 1, colEnd: grid.colEnd)
        
        let blGrid = Grid(grid: grid.grid, rowStart: midRow + 1, rowEnd: grid.rowEnd, colStart: grid.colStart, colEnd: midCol)
        let brGrid = Grid(grid: grid.grid, rowStart: midRow + 1, rowEnd: grid.rowEnd, colStart: midCol + 1, colEnd: grid.colEnd)
        
        return (tlGrid, trGrid, blGrid, brGrid)
    }
    
    private func allSameValue(_ grid: Grid) -> Bool {
        guard grid.rowStart < grid.rowEnd, grid.colStart < grid.colEnd else {
            return true
        }
        
        let firstValue = grid.grid[grid.rowStart][grid.colStart]
        for row in grid.rowStart...grid.rowEnd {
            for col in grid.colStart...grid.colEnd {
                if grid.grid[row][col] != firstValue {
                    return false
                }
            }
        }
        return true
    }
}

extension QuadTree {
    struct Grid {
        let grid: [[Int]]
        let rowStart: Int
        let rowEnd: Int
        let colStart: Int
        let colEnd: Int

        var firstBool: Bool {
            return grid[rowStart][colStart] == 1
        }
    }
    
    class Node {
         var val: Bool
          var isLeaf: Bool
          var topLeft: Node?
          var topRight: Node?
          var bottomLeft: Node?
          var bottomRight: Node?
        
          init(_ val: Bool, _ isLeaf: Bool) {
             self.val = val
             self.isLeaf = isLeaf
             self.topLeft = nil
             self.topRight = nil
             self.bottomLeft = nil
             self.bottomRight = nil
         }
     }
}
