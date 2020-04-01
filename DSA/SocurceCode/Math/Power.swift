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
        print(myPow(0.00001, 58110))
    }
    
    func myPow(_ number: Double, _ power: Int ) -> Double {
        
        if power == 0 {
            return 1
        }
                
        if number > 0 {
            return number * myPow(number, power - 1)
        }
        else {
            return 1 / (number * myPow(number, -power - 1))
        }
    }
}
