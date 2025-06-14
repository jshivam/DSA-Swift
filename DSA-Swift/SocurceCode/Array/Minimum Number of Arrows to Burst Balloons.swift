//
//  Untitled.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 14/06/25.
//  Copyright © 2025 Shivam Jaiswal. All rights reserved.
//

class MinimumNumberofArrowstoBurstBalloons: Executable {
    func excecute() {
        print(findMinArrowShots([[10,16],[2,8],[1,6],[7,12]]))
        print(findMinArrowShots([[1,2],[3,4],[5,6],[7,8]]))
    }
    
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        guard points.count > 1  else {
            return points.count
        }
        
        let points = points.sorted { (first, second) -> Bool in
            return first[0] < second[0]
        }
        
        var commanBallonRange = 0
        var tempStart = points[0][0]
        var tempEnd = points[0][1]
        
        for (index, ballonRange) in points.enumerated() where index > 0 {
            let localStart = max(ballonRange[0], tempStart)
            let localEnd = min(ballonRange[1], tempEnd)
            
            if localStart <= localEnd {
                tempStart = localStart
                tempEnd = localEnd
                commanBallonRange += 1
            }
            else {
                tempStart = ballonRange[0]
                tempEnd = ballonRange[1]
            }
        }
        
        return points.count - commanBallonRange
    }
}
