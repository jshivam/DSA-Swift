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
        
        let tree = QuadTree().construct(
            [[1,1],[1,1]]
        )
        print (tree)
    }
}
