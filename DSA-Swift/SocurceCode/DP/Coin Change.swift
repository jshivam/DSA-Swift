//
//  Coin Change.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 02/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit
/**
 You are given coins of different denominations and a total amount of money amount. Write a function to compute the fewest number of coins that you need to make up that amount. If that amount of money cannot be made up by any combination of the coins, return -1.

 Example 1:

     Input: coins = [1, 2, 5], amount = 11
     Output: 3
     
     Explanation: 11 = 5 + 5 + 1
 
 Example 2:

     Input: coins = [2], amount = 3
     Output: -1
     
 Note:
 You may assume that you have an infinite number of each kind of coin.
*/
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
