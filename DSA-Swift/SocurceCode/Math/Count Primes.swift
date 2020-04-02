//
//  Count Primes.swift
//  DSA
//
//  Created by Shivam Jaiswal on 07/10/19.
//  Copyright © 2019 Shivam Jaiswal. All rights reserved.
//

import UIKit

class CountPrimes: Executable {

    func excecute() {
        print(countPrimes(10))
    }
    
    func countPrimes(_ n: Int) -> Int {
         
         if n < 2 {
             return 0
         }
    
         var count = 0
         for item in 2..<n where item.isPrime() {
             count += 1
         }
         return count
     }
}

extension Int {
    func isPrime() -> Bool {
        let range = 2...(Int(ceil((sqrt(Double(abs(self)))))) + 1)
        for index in range where  (index != self) && (self % index == 0) {
            return false
        }
        return true
    }
}
