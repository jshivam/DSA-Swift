//
//  Longest Consecutive Sequence.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 22/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

class Longest_Consecutive_Sequence: Executable {
    func excecute() {
        print(longestConsecutive([100, 4, 200, 1, 3, 2]))
    }

    func longestConsecutive(_ nums: [Int]) -> Int {
        var map = [Int: Bool]()
        for item in nums { map[item] = true }
        var maxLength = 0

        for item in nums
        {
            guard let _ = map[item - 1] else {
                var current = item
                var count = 1
                while let _ = map[current + 1] {
                    count += 1
                    current += 1
                }
                maxLength = max(maxLength, count)
                continue
            }
        }
        return maxLength
    }
}
