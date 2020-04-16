//
//  Maximum Product Sum Among All Rotations.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 16/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

/**
 Given an array arr[] of n integers, find the maximum that maximizes the sum of the value of i*arr[i] where i varies from 0 to n-1.

 Examples:
 Input: arr[] = {8, 3, 1, 2}
 Output: 29
 Explanation: Lets look at all the rotations,
 {8, 3, 1, 2} = 8*0 + 3*1 + 1*2 + 2*3 = 11
 {3, 1, 2, 8} = 3*0 + 1*1 + 2*2 + 8*3 = 29
 {1, 2, 8, 3} = 1*0 + 2*1 + 8*2 + 3*3 = 27
 {2, 8, 3, 1} = 2*0 + 8*1 + 3*2 + 1*1 = 17

 Input: arr[] = {3, 2, 1}
 Output: 7
 Explanation: Lets look at all the rotations,
 {3, 2, 1} = 3*0 + 2*1 + 1*2 = 4
 {2, 1, 3} = 2*0 + 1*1 + 3*2 = 7
 {1, 3, 2} = 1*0 + 3*1 + 2*2 = 7

*/

class Maximum_Product_Sum_Among_All_Rotations: Executable {
    func excecute() {
        print(maxSum([3, 2, 1]))
    }

    func maxSum(_ array: [Int]) -> Int {
        guard array.count > 1 else { return 0 }

        let sum = array.reduce(0, +)
        var prevProdSum = array.enumerated().reduce(0){$0 + $1.0 * $1.1 }
        var maxProdSum = prevProdSum

        for pivot in 1..<array.endIndex {
            let nextProdSum = prevProdSum - (sum - array[pivot - 1]) + array[pivot - 1] * (array.endIndex - 1)
            maxProdSum = max(nextProdSum, maxProdSum)
            prevProdSum = nextProdSum
        }
        return maxProdSum
    }
}
