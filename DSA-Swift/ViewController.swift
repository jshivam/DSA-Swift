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
        
        let ll = LinkList<Int>()
        ll.append(4)
        ll.append(2)
        ll.append(1)
        ll.append(3)
        ll.append(0)
        
        ll.sort()
        
        print(ll.description)
    }
}
