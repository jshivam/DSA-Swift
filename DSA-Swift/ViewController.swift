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
        
        let medianFinder = MedianFinder()
        
        medianFinder.addNum(-1);
        print(medianFinder.findMedian())
        medianFinder.addNum(-2);
        print(medianFinder.findMedian())
        medianFinder.addNum(-3);
        print(medianFinder.findMedian())
        medianFinder.addNum(-4);
        print(medianFinder.findMedian())
        medianFinder.addNum(-5);
        print(medianFinder.findMedian())
    }
}
