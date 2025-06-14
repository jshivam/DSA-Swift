//
//  EvaluateReversePolishNotation.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 14/06/25.
//  Copyright © 2025 Shivam Jaiswal. All rights reserved.
//

import Foundation

class EvaluateReversePolishNotation: Executable {
    func excecute() {
        print(evalRPN(["10","6","9","3","+","-11","*","/","*","17","+","5","+"]))
    }
    
    func evalRPN(_ tokens: [String]) -> Int {
        var stack: [Int] = []
        
        for token in tokens {
            switch token {
                case "+":
                    let right = stack.removeLast()
                    let left = stack.removeLast()
                    stack.append(left + right)
                
                case "-":
                    let right = stack.removeLast()
                    let left = stack.removeLast()
                    stack.append(left - right)
                
                case "*":
                    let right = stack.removeLast()
                    let left = stack.removeLast()
                    stack.append(left * right)

                case "/":
                    let right = stack.removeLast()
                    let left = stack.removeLast()
                    stack.append(left / right)
                
                default:
                    let num = Int(token)!
                    stack.append(num)
                    
            }
        }
        
        return stack.first!
    }
}
