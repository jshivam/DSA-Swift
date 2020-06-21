//
//  Minimum Remove to Make Valid Parentheses.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 05/06/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit
/**
 Given a string s of '(' , ')' and lowercase English characters.

 Your task is to remove the minimum number of parentheses ( '(' or ')', in any positions ) so that the resulting parentheses string is valid and return any valid string.

 Formally, a parentheses string is valid if and only if:

 It is the empty string, contains only lowercase characters, or
 It can be written as AB (A concatenated with B), where A and B are valid strings, or
 It can be written as (A), where A is a valid string.


 Example 1:

     Input: s = "lee(t(c)o)de)"
     Output: "lee(t(c)o)de"
     Explanation: "lee(t(co)de)" , "lee(t(c)ode)" would also be accepted.

 Example 2:

     Input: s = "a)b(c)d"
     Output: "ab(c)d"

 Example 3:

     Input: s = "))(("
     Output: ""
     Explanation: An empty string is also valid.

 Example 4:

     Input: s = "(a(b(c)d)"
     Output: "a(b(c)d)"

 Constraints:

     1 <= s.length <= 10^5
     s[i] is one of  '(' , ')' and lowercase English letters.
*/
class Minimum_Remove_to_Make_Valid_Parentheses: Executable {
    func excecute() {
        print(minRemoveToMakeValid("lee(t(c)o)de)(a"))
    }

    func minRemoveToMakeValid(_ s: String) -> String {
        var open = 0
        var temp = [Character]()

        for char in s {
            if char == "(" {
                open += 1
            } else if char == ")" {
                if open == 0 {
                    continue
                }
                open -= 1
            }
            temp.append(char)
        }

        var result = ""
        for index in stride(from: temp.count - 1, through: 0, by: -1) {
            if temp[index] == "(" && open > 0 {
                open -= 1
                continue
            }
            result.append(temp[index])
        }

        return String(result.reversed())
    }
}
