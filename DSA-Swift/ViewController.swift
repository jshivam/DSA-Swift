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
        let obj = RandomizedSet()
        print(obj.remove(0))
        print(obj.remove(0))
        print(obj.insert(0))
        print(obj.getRandom())
        print(obj.remove(0))
        print(obj.insert(0))
    }
}

