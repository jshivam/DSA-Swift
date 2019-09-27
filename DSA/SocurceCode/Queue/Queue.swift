//
//  Queue.swift
//  DSA
//
//  Created by Shivam Jaiswal on 19/09/19.
//  Copyright © 2019 Shivam Jaiswal. All rights reserved.
//

import UIKit


class Queue<T>: LinkList<T>{
    @discardableResult func dequeue() -> T?{
        return removeFirst()
    }
    
    func enqueue(_ item: T) {
        append(item)
    }
}
