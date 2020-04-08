//
//  Binary Tree Paths.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 08/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

extension TreeNode {
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        guard let root = root else { return [] }
        let stack = Stack()
        var paths = [String]()
        inOrder(root, stack, &paths)
        return paths
    }

    func inOrder(_ root: TreeNode?, _ stack: Stack, _ paths: inout [String]) {
        guard let root = root else { return }
        stack.push(root.val)
        inOrder(root.left, stack, &paths)
        if isLeaf(root) {
            paths.append(stack.formatedItems)
        }
        inOrder(root.right, stack, &paths)
        stack.pop()
    }

    private func isLeaf(_ root: TreeNode?) -> Bool {
       guard let root = root else { return true }
       return root.left == nil && root.right == nil
    }
}

class Stack {
    private var items = [Int]()

    func push(_ item: Int) {
        items.append(item)
    }

    @discardableResult
    func pop() -> Int? {
        return items.isEmpty ? nil : items.removeLast()
    }

    var formatedItems: String {
        let items = self.items
        var result = ""
        for item in items {
            result.append("\(item)->")
        }

        if !result.isEmpty {
            result.removeLast()
            result.removeLast()
        }
        return result
    }
}
