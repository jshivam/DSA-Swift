//
//  Construct Binary Tree from Preorder and Inorder Traversal.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 20/05/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

extension TreeNode {
    static func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard !preorder.isEmpty, !inorder.isEmpty else { return nil }
        var preIndex = 0
        var hashMap = [Int : Int]()
        for (index, item) in inorder.enumerated() { hashMap[item] = index }

        func buildTreeHelper(preorder: [Int], inorder: [Int], start: Int, end: Int) -> TreeNode? {
            if start > end { return nil }
            let root = TreeNode(preorder[preIndex])
            preIndex += 1
            if start == end { return root }
            let index = hashMap[root.val]!
            root.left = buildTreeHelper(preorder: preorder, inorder: inorder, start: start, end: index - 1)
            root.right = buildTreeHelper(preorder: preorder, inorder: inorder, start: index + 1, end: end)

            return root
        }

        return buildTreeHelper(preorder: preorder, inorder: inorder, start: 0, end: inorder.endIndex - 1)
    }
}
