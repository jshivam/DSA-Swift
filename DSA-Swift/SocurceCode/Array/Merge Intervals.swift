//
//  Merge Intervals.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 22/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

/**
 Given a collection of intervals, merge all overlapping intervals.

 Example 1:

     Input: [[1,3],[2,6],[8,10],[15,18]]
     Output: [[1,6],[8,10],[15,18]]
     Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].

 Example 2:

     Input: [[1,4],[4,5]]
     Output: [[1,5]]
     Explanation: Intervals [1,4] and [4,5] are considered overlapping.
*/

class Merge_Intervals: Executable {

    func excecute() {
        print(merge([[1,3],[2,6],[8,10],[15,18]]))
    }

    func merge(_ intervals: [[Int]]) -> [[Int]] {
        if intervals.isEmpty {
            return []
        }

        if intervals.count == 1 {
            return intervals
        }

        let intervals = intervals.sorted{$0[0] < $1[0]}

        var result = [[Int]]()
        result.append(intervals[0])

        for index in 1..<intervals.count {
            let prev = result.last!
            let next = intervals[index]
            if prev[1] >= next[0] {
                let item = [prev[0], max(next[1], prev[1])]
                result.removeLast()
                result.append(item)
            }else{
                result.append(next)
            }
        }

        return result
    }
}
