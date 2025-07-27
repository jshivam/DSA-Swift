//
//  IPO.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 27/07/25.
//  Copyright © 2025 Shivam Jaiswal. All rights reserved.
//

import Foundation
/**
 Suppose LeetCode will start its IPO soon. In order to sell a good price of its shares to Venture Capital, LeetCode would like to work on some projects to increase its capital before the IPO. Since it has limited resources, it can only finish at most k distinct projects before the IPO. Help LeetCode design the best way to maximize its total capital after finishing at most k distinct projects.

 You are given n projects where the ith project has a pure profit profits[i] and a minimum capital of capital[i] is needed to start it.

 Initially, you have w capital. When you finish a project, you will obtain its pure profit and the profit will be added to your total capital.

 Pick a list of at most k distinct projects from given projects to maximize your final capital, and return the final maximized capital.

 The answer is guaranteed to fit in a 32-bit signed integer.

  

 Example 1:

     Input: k = 2, w = 0, profits = [1,2,3], capital = [0,1,1]
     Output: 4
     Explanation: Since your initial capital is 0, you can only start the project indexed 0.
     After finishing it you will obtain profit 1 and your capital becomes 1.
     With capital 1, you can either start the project indexed 1 or the project indexed 2.
     Since you can choose at most 2 projects, you need to finish the project indexed 2 to get the maximum capital.
     Therefore, output the final maximized capital, which is 0 + 1 + 3 = 4.
     Example 2:

     Input: k = 3, w = 0, profits = [1,2,3], capital = [0,1,2]
     Output: 6
  

 Constraints:

 1 <= k <= 105
 0 <= w <= 109
 n == profits.length
 n == capital.length
 1 <= n <= 105
 0 <= profits[i] <= 104
 0 <= capital[i] <= 109
*/


class IPO: Executable {
    func excecute() {
        print(findMaximizedCapital(3, 0, [1,2,3], [0,1,2]))
    }
    
    func findMaximizedCapital(_ k: Int, _ w: Int, _ profits: [Int], _ capitals: [Int]) -> Int {
        var projects: [Project] = []
        for (capital, profit) in zip(capitals, profits) {
            projects.append(Project(profit: profit, capital: capital))
        }
        // Sort by capital requirement (ascending)
        projects.sort { $0.capital < $1.capital }
        
        var maxCapital = w
        var count = 0
        var projectIndex = 0
        
        // Max heap for profits (we want highest profit first)
        let maxHeapProfit = Heap<Project>(ordering: .max)
        
        // We can do at most k projects
        while count < k {
            // Add all affordable projects to the heap
            while projectIndex < projects.count && projects[projectIndex].capital <= maxCapital {
                maxHeapProfit.insert(projects[projectIndex])
                projectIndex += 1
            }
            
            // If no projects are affordable, break
            if maxHeapProfit.isEmpty {
                break
            }
            
            // Take the most profitable project
            if let topProject = maxHeapProfit.delete() {
                maxCapital += topProject.profit
                count += 1
            }
        }
        
        return maxCapital
    }
}

struct Project: Comparable {
    static func < (lhs: Project, rhs: Project) -> Bool {
        return lhs.profit < rhs.profit
    }

    static func == (lhs: Project, rhs: Project) -> Bool {
        lhs.capital == rhs.capital && lhs.profit == rhs.profit
    }
    
    let profit: Int
    let capital: Int
}
