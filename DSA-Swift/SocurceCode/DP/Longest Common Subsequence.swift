//
//  Longest Common Subsequence.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 31/05/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

class Longest_Common_Subsequence: Executable {
    func excecute() {
        print(longestCommonSubsequence("AGGTAB", "GXTXAYB"))
    }

    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        var dp = [Key: Int]()
        dp[Key(m: 0, n: 0)] = 0

        func lcsHelper(_ text1: [Character], _ text2: [Character], _ m: Int, _ n: Int) -> Int {
            if let cache = dp[Key(m: m, n: n)] {
                return cache
            }

            if m == 0 || n == 0 {
                dp[Key(m: m, n: n)] = 0
                return 0
            }

            if text1[m - 1] == text2[n - 1] {
                let result = 1 + lcsHelper(text1, text2, m - 1, n - 1)
                dp[Key(m: m, n: n)] = result
                return result
            }

            let lhs = lcsHelper(text1, text2, m - 1, n)
            let rhs = lcsHelper(text1, text2, m, n - 1)
            let result = max(lhs, rhs)
            dp[Key(m: m, n: n)] = result
            return result
        }

        let s1 = Array(text1)
        let s2 = Array(text2)
        return lcsHelper(s1, s2, s1.count, s2.count)
    }

    struct Key: Hashable {
        let m: Int
        let n: Int
    }
}
