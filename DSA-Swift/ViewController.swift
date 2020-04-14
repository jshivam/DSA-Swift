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
        let array = [10, 80, 30, 90, 40, 50, 70]
        let sorter = Sorter<Int>()
//        print(sorter.sort(array, using: .mergeSort))
        print(sorter.sort(array, using: .quickSort))
    }
}
