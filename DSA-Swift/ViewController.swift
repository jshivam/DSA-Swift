//
//  ViewController.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 02/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let maxHeap = Heap<Int>(ordering: .max)
        maxHeap.insert(20)
        maxHeap.insert(18)
        maxHeap.insert(17)
        maxHeap.insert(15)
        maxHeap.insert(14)
        
        maxHeap.insert(21)
        maxHeap.insert(15)

        print(maxHeap.items)
        
        maxHeap.delete()

        print(maxHeap.items)
    }
}
