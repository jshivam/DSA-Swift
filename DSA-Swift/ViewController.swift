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
        let list = LinkList<Int>.init()
        for item in 1...4 {
            list.append(item)
        }

        print(list.description)

        LinkList.reorderList(list.head)

        print(list.description)
    }
}

