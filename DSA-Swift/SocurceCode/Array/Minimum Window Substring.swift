//
//  Minimum Window Substring.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 10/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

/**
 Given a string S and a string T, find the minimum window in S which will contain all the characters in T in complexity O(n).

 Example:

     Input: S = "ADOBECODEBANC", T = "ABC"
     Output: "BANC"

 Note:
 If there is no such window in S that covers all characters in T, return the empty string "".
 If there is such window, you are guaranteed that there will always be only one unique minimum window in S.
*/

class Minimum_Window_Substring: Executable {
    func excecute() {
        print(minWindow("ADOBECODEBANC", "ABC"))
    }

    func minWindow(_ s: String, _ t: String) -> String {
        let patternSize = t.count
        let stringSize = s.count
        guard patternSize <= stringSize else { return "" }
        var leftIndex = 0
        var range: ClosedRange<Int>?
        var count = 0
        var minimum = Int.max
        var hashMap = [Character : Int]()

        for char in t {
            hashMap[char, default: 0] += 1
        }

        let s = Array(s)
        for rightIndex in 0..<stringSize {

            hashMap[s[rightIndex], default: 0] -= 1
            if hashMap[s[rightIndex], default: 0] >= 0 {
                count += 1
            }

            while count == patternSize {

                if (rightIndex - leftIndex + 1) < minimum {
                    minimum = rightIndex - leftIndex + 1
                    range = leftIndex...rightIndex
                }

                let head = s[leftIndex]
                hashMap[head]! += 1
                if hashMap[head]! > 0 {
                    count -= 1
                }
                leftIndex += 1
            }
        }

        return range == nil ? "" : String(s[range!])
    }

}
