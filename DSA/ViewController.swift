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
        
        let ll = LinkList<Int>()
        ll.append(2)
        ll.append(5)
        ll.append(1)
        ll.append(8)
    }
}

