//
//  Coin Change.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 02/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

class Coin_Change: Executable {
    func excecute() {
        print(coinChange([1, 2, 5], 11))
    }

    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var dp = Array(repeating: amount + 1, count: amount + 1)
        dp[0] = 0

        for currentAmount in 0...amount {
            for coin in coins where coin <= currentAmount {
               dp[currentAmount] = min(dp[currentAmount], 1 + dp[currentAmount - coin])
            }
        }
        return dp[amount] > amount ? -1 : dp[amount]
    }
}
