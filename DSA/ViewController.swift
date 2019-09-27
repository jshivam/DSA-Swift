//
//  ViewController.swift
//  DSA
//
//  Created by Shivam Jaiswal on 19/09/19.
//  Copyright © 2019 Shivam Jaiswal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let list = LinkList<String>()
        list.append("0")
        list.append("1")
        list.append("2")
        list.append("3")
        
        print(list.description)
        
        list.insert("X", at: 3)
        print(list.description)
    }
}

