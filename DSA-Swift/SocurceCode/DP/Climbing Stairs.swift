//
//  Climbing Stairs.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 02/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

class Climbing_Stairs: Executable {
    func excecute() {
        print(climbStairs(4))
    }

    func climbStairs(_ n: Int) -> Int {
        var dp = [Int: Int]()
        climbStairsUtlil(n: n, dp: &dp)
        return dp[n] ?? 0
    }

    @discardableResult
    private func climbStairsUtlil(n: Int, dp: inout [Int: Int]) -> Int {
        if let result = dp[n] { return result }
        guard n > 2 else { dp[n] = n; return n }
        let value = climbStairsUtlil(n: n - 1, dp: &dp ) + climbStairsUtlil(n: n - 2, dp: &dp)
        dp[n] = value
        return value
    }
}
