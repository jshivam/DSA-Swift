//
//  Longest Substring Of All Vowels in Order.swift
//  DSA-Swift
//
//  Created by FitBudd on 03/03/24.
//  Copyright © 2024 Shivam Jaiswal. All rights reserved.
//

import UIKit

class Longest_Substring_Of_All_Vowels_in_Order: Executable {
    func excecute() {
        print(longestBeautifulSubstring("a"))
    }
    
    func longestBeautifulSubstring(_ word: String) -> Int {
        let vovel = ["a", "e", "i", "o", "u"]
            
        var startIndex = 0
        var vovelIndex = 0
        var length = 0
        
        for (index,char) in word.enumerated() {
            
            if (vovelIndex < vovel.endIndex && (String(char) == vovel[vovelIndex])) {
                vovelIndex += 1
                if char == "a" {
                    startIndex = index
                }
            }
            else if (vovelIndex > 0 && String(char) == vovel[vovelIndex - 1]) {
                continue
            }
            else {
                if vovelIndex == vovel.endIndex {
                    let locallength = index - startIndex
                    length = max(length, locallength)
                }
                if char == "a" {
                    vovelIndex = 1
                    startIndex = index
                } else {
                    vovelIndex = 0
                    startIndex = Int.min
                }
            }
        }
        
        if vovelIndex == vovel.endIndex && startIndex >= 0  {
            let locallength = word.count - startIndex
            length = max(length, locallength)
        }
        
        return length
    }
}
