//
//  Best Time to Buy and Sell Stock.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 04/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

class Best_Time_to_Buy_and_Sell_Stock: Executable {
    func excecute() {
        print(maxProfit([7,1,5,3,6,4]))
    }

    func maxProfit(_ prices: [Int]) -> Int {
        var profit = 0
        var localMinimum = Int.max
        for price in prices {
            if price < localMinimum {
                localMinimum = price
            } else {
                profit = max(profit, price - localMinimum)
            }
        }
        return profit
    }
}
