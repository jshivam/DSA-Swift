//
//  Palindrome Number.swift
//  DSA
//
//  Created by Shivam Jaiswal on 29/03/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

class PalindromeNumber: Executable {
    func excecute() {
        print(isPalindrome(122211))
    }

    func isPalindrome(_ x: Int) -> Bool {
        var start = 0
        var last = x.count - 1
        while start < last {
            guard x[last] == x[start] else { return false }
            start += 1
            last -= 1
        }
        return true
    }
}

private extension Int {
    var count: Int {
        var count = 0
        var number = self
        while number != 0 {
            number /= 10
            count += 1
        }
        return count
    }

    subscript (_ index: Int) -> Int {
        get {
            let divider = Int(pow(10, Double(index)))
            let res = self / divider
            return res % 10
        }
    }
}
