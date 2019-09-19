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
        
        let executable = WordLadder.excecute()
        print(executable)
    }
}

