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
        
//        let executable = WordLadder.excecute()
//        print(executable)
        
        let listA = LinkList<Int>()
        listA.append(1)
        listA.append(2)
        listA.append(3)
        
        let listB = LinkList<Int>()
        listB.append(10)
        listB.append(20)
        listB.append(30)
        
        print(listA < listB)
    }
}

