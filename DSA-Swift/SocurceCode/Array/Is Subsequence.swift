//
//  Is Subsequence.swift
//  DSA-Swift
//
//  Created by FitBudd on 03/03/24.
//  Copyright © 2024 Shivam Jaiswal. All rights reserved.
//

import UIKit

/*
 
 Given two strings s and t, return true if s is a subsequence of t, or false otherwise.

 A subsequence of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).

  
 Example 1:

 Input: s = "abc", t = "ahbgdc"
 Output: true
 Example 2:

 Input: s = "axc", t = "ahbgdc"
 Output: false

*/

class Is_Subsequence: Executable {
    func excecute() {
        print(isSubsequence("axc", "ahbgdc"))
    }
    
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        
        guard !s.isEmpty else { return true }
        
        let arrayS = Array(s)
        let arrayT = Array(t)
        
        var sIndex = 0
        
        for itemT in arrayT {
            if itemT == arrayS[sIndex] {
                sIndex += 1
                if sIndex == arrayS.endIndex {
                    return true
                }
            }
        }
        return false
    }
}
