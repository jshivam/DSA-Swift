//
//  Longest Common Prefix.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 22/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

/**
 Write a function to find the longest common prefix string amongst an array of strings.

 If there is no common prefix, return an empty string "".

 Example 1:

        Input: ["flower","flow","flight"]
        Output: "fl"

 Example 2:

        Input: ["dog","racecar","car"]
        Output: ""

 Explanation: There is no common prefix among the input strings.
*/

class Longest_Common_Prefix: Executable {

    func excecute() {
        print(longestCommonPrefix(["flower","flow","flight"]))
    }

    func longestCommonPrefix(_ strs: [String]) -> String
    {
        if strs.isEmpty {
            return ""
        }

        var prefix = ""
        var charIndex = 0
        while (true)
        {
            var count = 0
            var char: Character? = nil
            while (count < strs.endIndex)
            {
                let string = strs[count]
                if charIndex < string.count {
                    let currentChar = string[charIndex]
                    if char == nil {
                        char = currentChar
                    }else{
                        if char! != currentChar{
                            return prefix
                        }
                    }
                }
                else
                {
                    return prefix
                }
                count += 1
            }
            prefix = prefix + String(char ?? Character(""))
            charIndex += 1
        }
    }
}

private extension String{
    subscript (i: Int) -> Character{
        return self[index(self.startIndex, offsetBy: i)]
    }
}
