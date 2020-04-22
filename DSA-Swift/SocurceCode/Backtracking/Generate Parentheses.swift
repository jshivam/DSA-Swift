//
//  Generate Parentheses.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 22/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit
/**
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

 For example, given n = 3, a solution set is:

        "((()))",
        "(()())",
        "(())()",
        "()(())",
        "()()()"
*/
class Generate_Parentheses: Executable {
    func excecute() {
        print(generateParenthesis(3))
    }

      func generateParenthesis(_ n: Int) -> [String] {
          var ans = [String]()
          backtrack(&ans, "", 0, 0, n);
          return ans;
      }


      func backtrack(_ ans: inout [String], _ cur: String, _ open: Int, _ close: Int, _ max: Int)
      {
          if (cur.count == max * 2) {
              ans.append(cur);
              return;
          }

          if (open < max){
              backtrack(&ans, cur+"(", open + 1, close, max);
          }
          if (close < open){
              backtrack(&ans, cur+")", open, close + 1, max);
          }
      }
}
