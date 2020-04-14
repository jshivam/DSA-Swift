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
        let array = [3, 4, 1, 5, 5, 6, 9, 0]
        let sorter = Sorter<Int>()
        print(sorter.sort(array, using: .mergeSort))
    }
}
