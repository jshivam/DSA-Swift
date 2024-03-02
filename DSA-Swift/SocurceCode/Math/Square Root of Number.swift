//
//  Square Root of Number.swift
//  DSA-Swift
//
//  Created by FitBudd on 01/03/24.
//  Copyright © 2024 Shivam Jaiswal. All rights reserved.
//

import Foundation

class SquareRootofNumber: Executable {
    func excecute() {
        print(mySqrt(8))
    }
    
    func mySqrt(_ x: Int) -> Int {
        var start = 1
        var end = x

        while start <= end {
            let mid = (start + end) / 2
            let midSquare = mid * mid
            if midSquare == x {
                return mid
            }
            else if midSquare > x {
                end = mid - 1
            }
            else {
                start = mid + 1
            }
        }
        
        return min(end, start)
    }
}
