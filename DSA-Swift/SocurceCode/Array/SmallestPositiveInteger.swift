//
//  Smallest positive integer value that cannot be represented as sum of any subset of a given array.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 04/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

/**
 Find the smallest positive integer value that cannot be represented as sum of any subset of a given array
 Given a sorted array (sorted in non-decreasing order) of positive numbers, find the smallest positive integer value that cannot be represented as sum of elements of any subset of given set.
 Expected time complexity is O(n).

 Examples:

     Input:  arr[] = {1, 3, 6, 10, 11, 15};
     Output: 2

     Input:  arr[] = {1, 1, 1, 1};
     Output: 5

     Input:  arr[] = {1, 1, 3, 4};
     Output: 10

     Input:  arr[] = {1, 2, 5, 10, 20, 40};
     Output: 4

     Input:  arr[] = {1, 2, 3, 4, 5, 6};
     Output: 22
*/
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
