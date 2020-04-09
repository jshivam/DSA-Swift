//
//  Reorder List.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 09/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

extension LinkList {
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
