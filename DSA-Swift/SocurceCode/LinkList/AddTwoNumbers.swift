//
//  AddTwoNumbers.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 17/06/25.
//  Copyright © 2025 Shivam Jaiswal. All rights reserved.
//

import Foundation

extension LinkList {
    /**
     You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

     You may assume the two numbers do not contain any leading zero, except the number 0 itself.

     Example 1:
     
         Input: l1 = [2,4,3], l2 = [5,6,4]
         Output: [7,0,8]
         
     Explanation: 342 + 465 = 807.
     
     Example 2:

         Input: l1 = [0], l2 = [0]
         Output: [0]
     
     Example 3:

         Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
         Output: [8,9,9,9,0,0,0,1]
      

     Constraints:

     The number of nodes in each linked list is in the range [1, 100].
     0 <= Node.val <= 9
     It is guaranteed that the list represents a number that does not have leading zeros.

    */

    static func addTwoNumbers(_ l1: Node?, _ l2: Node?) -> Node? where T == Int {
        if l1 == nil, l2 == nil {
            return nil
        }
        else if l1 == nil {
            return l2
        }
        else if l2 == nil {
            return l1
        }
        else {
            var resultHead: Node? = nil
            var l1Current = l1
            var l2Current = l2
            var current: Node? = nil
            var carry: Int = 0
            
            while l1Current != nil || l2Current != nil {
                let value = (l1Current?.value ?? 0) + (l2Current?.value ?? 0) + carry

                if resultHead == nil {
                    resultHead = Node(value % 10)
                    current = resultHead
                }
                else {
                    let newNode = Node(value % 10)
                    current?.next = newNode
                    current = current?.next
                }
                
                l1Current = l1Current?.next
                l2Current = l2Current?.next

                carry = value / 10
            }
            
            if carry > 0 {
                let newNode = Node(carry)
                current?.next = newNode
            }
            
            return resultHead
        }
    }
}
