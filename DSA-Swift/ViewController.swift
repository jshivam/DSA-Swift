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
        let tri = Tri<String>()
        tri.add("abc")
        tri.add("abgl")
        tri.add("cdf")
        tri.add("abc")
        tri.add("abcd")
        tri.add("lmn")

        print(tri.search("abc"))
        print(tri.search("adada"))
        print(tri.search("adada"))
    }
}
