//
//  Smallest positive integer value that cannot be represented as sum of any subset of a given array.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 04/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

class SmallestPositiveInteger: Executable {
    func excecute() {
        print(findSmallest([1, 2, 5, 10, 20, 40]))
    }

    func findSmallest(_ numbers: [Int]) -> Int {
        var result = 1
        for item in numbers where result >= item {
            result += item
        }
        return result
    }
}
