//
//  Power.swift
//  DSA
//
//  Created by Shivam Jaiswal on 21/09/19.
//  Copyright © 2019 Shivam Jaiswal. All rights reserved.
//

import Foundation

class Pwoer: Executable {
    func excecute() {
        print(myPow(0.00001, 2147483647))
    }
    
    func myPow(_ number: Double, _ power: Int ) -> Double {
        if power == 0 {
            return 1
        } else if power < 0 {
            return 1/myPow(number,-power)
        } else if power % 2 == 0 {
            let half = myPow(number, power/2)
            return half * half
        } else {
            return number * myPow(number, power-1)
        }
    }
}
