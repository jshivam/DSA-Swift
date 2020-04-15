//
//  Edit Distance.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 15/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

class Edit_Distance: Executable {
    func excecute() {
        print(minDistance("", ""))
    }

    func minDistance(_ word1: String, _ word2: String) -> Int {
        let word1 = Array(word1)
        let word2 = Array(word2)

        var dp = [[Int]]()

        for _ in 0...word2.endIndex {
            let row = Array(repeating: Int.max, count: word1.endIndex + 1)
            dp.append(row)
        }

        for row in 0...word2.endIndex {
            for col in 0...word1.endIndex {
                if row == 0 {
                    dp[row][col] = col
                }
                else if col == 0 {
                    dp[row][col] = row
                }
                else if word1[col - 1] == word2[row - 1] {
                    dp[row][col] = dp[row - 1][col - 1]
                } else {
                    dp[row][col] = 1 + min(dp[row - 1][col - 1], min(dp[row][col - 1], dp[row - 1][col]))
                }
            }
        }

        return dp.last?.last ?? 0
    }
}
