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
        let heap = Heap.init()
        heap.items = [9, 6, 5, 0, 8, 2, 1, 3]
        heap.buildMaxHeap()
        print(heap.items)
    }
}

