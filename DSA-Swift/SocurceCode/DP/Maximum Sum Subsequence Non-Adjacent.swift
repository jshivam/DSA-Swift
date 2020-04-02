//
//  Maximum Sum Subsequence Non-Adjacent.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 02/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

class MaximumSumSubsequenceNonAdjacent: Executable {
    func excecute() {
        print(maximumSumSubsequenceNonAdjacent([5, 5, 10, -100, 10, 5]))
    }

    func maximumSumSubsequenceNonAdjacent(_ array: [Int]) -> Int {
        guard !array.isEmpty else { return 0 }

        var inc = array[0]
        var exc = 0
        var prev_inc = 0

        for index in 1...array.count - 1 {
            prev_inc = inc
            inc = max(inc, exc + array[index])
            exc = prev_inc
        }
        return max(inc, exc)
    }
}
