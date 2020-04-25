//
//  Unique Binary Search Trees.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 24/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

extension Tree {
    static func numTrees(_ n: Int) -> Int {
        var dp = [Int : Int]()
        dp[0] = 1
        dp[1] = 1

        @discardableResult
        func numTreesUtil(_ n: Int) -> Int {
            if let trees = dp[n] { return trees }
            guard n > 1 else { return 1 }
            var result = 0
            for level in 0...n-1 {
                result += numTreesUtil(level) * numTreesUtil(n - level - 1)
            }
            dp[n] = result
            return result
        }

        numTreesUtil(n)
        return dp[n]!
    }
}
