//
//  Validate Binary Search Tree .swift
//  DSA
//
//  Created by Shivam Jaiswal on 17/10/19.
//  Copyright © 2019 Shivam Jaiswal. All rights reserved.
//

import Foundation

extension TreeNode
{
    func isValidBST(_ root: TreeNode?) -> Bool {
        return isValidBSTUtil(root, range: Int.min...Int.max)
    }
    
    func isValidBSTUtil(_ root: TreeNode? , range: ClosedRange<Int>) -> Bool
    {
        guard let root = root else { return true }

        if !range.contains(root.value) || range.lowerBound == root.value || range.upperBound == root.value {
            return false
        }
        
        let left = isValidBSTUtil(root.left, range: range.lowerBound...root.value)
        let right = isValidBSTUtil(root.right, range: root.value...range.upperBound)
        return left && right
    }
}
