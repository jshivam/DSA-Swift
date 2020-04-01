//
//  Jump Game.swift
//  DSA
//
//  Created by Shivam Jaiswal on 28/11/19.
//  Copyright © 2019 Shivam Jaiswal. All rights reserved.
//

import UIKit

class Jump_Game: Executable {

    func excecute() {
        print(jump([2,3,1,1,4]))
    }

    func jump(_ nums: [Int]) -> Int {
        guard nums.count > 1, let first = nums.first, first != 0 else { return 0 }

        var ladder = nums[0]
        var stairs = nums[0]
        var jumps = 1

        for level in 1..<nums.count {

            if level == nums.count - 1 {
                return jumps
            }

            if ladder < level + nums[level] {
                ladder = level + nums[level]
            }

            stairs -= 1

            if stairs == 0 {
                stairs = ladder - level
                jumps += 1
            }
        }

        return jumps
    }
}
