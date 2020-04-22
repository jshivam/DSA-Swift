//
//  Reorder List.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 09/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

extension LinkList {
    /**
     Given a singly linked list L: L0→L1→…→Ln-1→Ln,
     reorder it to:

         L0→Ln→L1→Ln-1→L2→Ln-2→…

     You may not modify the values in the list's nodes, only nodes itself may be changed.

     Example 1:

     Given

            1->2->3->4,

     reorder it to

            1->4->2->3.

     Example 2:

     Given

            1->2->3->4->5,

     reorder it to

            1->5->2->4->3.
    */

    static func reorderList(_ head: Node?) {
        var head = head
        func reorderListUtil(current: Node?) {
            guard let current = current else { return }
            reorderListUtil(current: current.next)
            if head?.next == nil { return }

            if head === current {
                current.next = nil
            }
            else if head?.next === current {
                head = head?.next
                head?.next = nil
            } else {
                let temp = head?.next
                head?.next = current
                current.next = temp
                head = temp
            }
        }
        reorderListUtil(current: head)
    }
}
