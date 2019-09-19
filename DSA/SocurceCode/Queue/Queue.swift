//
//  Queue.swift
//  DSA
//
//  Created by Shivam Jaiswal on 19/09/19.
//  Copyright © 2019 Shivam Jaiswal. All rights reserved.
//

import UIKit


class Queue<T>: LinkList<T>{
    @discardableResult func dequeue() -> T?
    {
        defer {
            head = head?.next
        }
        return head?.value
    }
    
    func enqueue(_ item: T) {
        super.append(item)
    }
}
