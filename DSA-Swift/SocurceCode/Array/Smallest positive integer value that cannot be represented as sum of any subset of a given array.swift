//
//  Smallest positive integer value that cannot be represented as sum of any subset of a given array.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 04/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

class Smallest_positive_integer_value_that_cannot_be_represented_as_sum_of_any_subset_of_a_given_array: Executable {
    func excecute() {
        print(findMininmumValue([1, 2, 5, 10, 20, 40]))
    }

    func findMininmumValue(_ numbers: [Int]) -> Int {
        var result = 1
        for item in numbers where result >= item {
            result += item
        }
        return result
    }
}
