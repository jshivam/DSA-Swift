//
//  Valid Parentheses.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 22/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit
/**
 Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 Note that an empty string is also considered valid.

 Example 1:

        Input: "()"
        Output: true

 Example 2:

        Input: "()[]{}"
        Output: true

 Example 3:

        Input: "(]"
        Output: false

 Example 4:

        Input: "([)]"
        Output: false

 Example 5:

         Input: "{[]}"
         Output: true
*/

class Valid_Parentheses: Executable {
    func excecute() {
        print(isValid("()"))
    }

    func isValid(_ s: String) -> Bool {
        let stack = Stack<Character>.init()

        for item in s
        {
            if item == "(" || item == "{" || item == "["{
                stack.push(item)
                continue
            }

            guard let popedItem = stack.pop() else { return false }

            if ((popedItem == "(" && item == ")") || (popedItem == "{" && item == "}") || (popedItem == "[" && item == "]")){ continue }

            return false
        }

        return stack.isEmpty()
    }

    class Stack<Element>{
        private var items = [Element]()

        func push(_ item: Element){
            items.append(item)
        }

        func pop() -> Element? {
            return items.isEmpty ? nil : items.removeLast()
        }

        func top() -> Element? {
            return items.last
        }

        func count() -> Int {
            return items.count
        }

        func isEmpty() -> Bool {
            return items.isEmpty
        }
    }
}
