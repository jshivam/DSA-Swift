//
//  Valid Number.swift
//  DSA
//
//  Created by Shivam Jaiswal on 05/10/19.
//  Copyright © 2019 Shivam Jaiswal. All rights reserved.
//

import Foundation

/*
 Some examples:
 "0" => true
 " 0.1 " => true
 "abc" => false
 "1 a" => false
 "2e10" => true
 " -90e3   " => true
 " 1e" => false
 "e3" => false
 " 6e-1" => true
 " 99e2.5 " => false
 "53.5e93" => true
 " --6 " => false
 "-+3" => false
 "95a54e53" => false
*/

class ValidNumber: Executable {

    func excecute() {
        let result = isNumber(".e1")
        print(result)
    }
    
    private enum NumberLiteral: Character
    {
        case zero = "0"
        case one = "1"
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        
        case dot = "."
        case expo = "e"
        case minus = "-"
        case plus = "+"
        
        case space = " "
    }
    
    func isNumber(_ s: String) -> Bool
   {
       let string = s.trimmingCharacters(in: .whitespacesAndNewlines)
       if string.isEmpty {
           return false
       }
       var hasVisitedExpo = false
       var hasVisitedDot = false
       var minusCount = 0
       var plusCount = 0
       
       let stringCount = string.count
       
       for (index, item) in string.enumerated()
       {
           guard let litreal = NumberLiteral(rawValue: item) else { return false }
           
           switch litreal {
           
           case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
               continue

           case .dot:
               if hasVisitedDot || hasVisitedExpo || stringCount == 1 { return false }
               if index != stringCount - 1{
                    guard let nextLitreal = NumberLiteral(rawValue: string[index + 1]) else {return false}
                    switch nextLitreal {
                    case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .expo:
                        break
                    default:
                        return false
                    }
                
                if index == 0 && nextLitreal == .expo{
                    return false
                }
                
               }
               else if index == stringCount - 1 {
                guard let prevLitreal = NumberLiteral(rawValue: string[index - 1]) else {return false}
                switch prevLitreal {
                case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
                    break
                default:
                    return false
                }
               }
               
               hasVisitedDot = true
               
           case .space:
               return false
               
           case .expo:
               if hasVisitedExpo || (index == 0) || (index == stringCount - 1) || stringCount == 1 { return false }
               guard let prevLitreal = NumberLiteral(rawValue: string[index - 1]), let nextLitreal = NumberLiteral(rawValue: string[index + 1]) else {return false}
               
               switch nextLitreal {
               case .dot, .expo:
                   return false
               default:
                   break
               }
               
               switch prevLitreal {
               case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .dot:
                   break
               default:
                   return false
               }
               
               
               
               hasVisitedExpo = true
               
           case .minus:
               if (minusCount > 0 && !hasVisitedExpo) || (hasVisitedExpo && minusCount > 1) || (index == stringCount - 1) || stringCount == 1{ return false }
               if hasVisitedExpo {
                   let prevLitreal = NumberLiteral(rawValue: string[index - 1])!
                   if prevLitreal != .expo {
                       return false
                   }
               }
               else if index != 0{
                   return false
               }
               else if index == 0 && stringCount == 1 {
                   return false
               }
               minusCount += 1
           
           case .plus:
               if (plusCount > 0 && !hasVisitedExpo) || (hasVisitedExpo && plusCount > 1) || (index == stringCount - 1) || stringCount == 1{ return false }
               if hasVisitedExpo {
                   let prevLitreal = NumberLiteral(rawValue: string[index - 1])!
                   if prevLitreal != .expo {
                       return false
                   }
               }
               else if index != 0{
                   return false
               }
               else if index == 0 && stringCount == 1 {
                   return false
               }
               plusCount += 1
           }
       }
       return true
   }
}

private extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    subscript (bounds: CountableRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ..< end]
    }
    subscript (bounds: CountableClosedRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ... end]
    }
    subscript (bounds: CountablePartialRangeFrom<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(endIndex, offsetBy: -1)
        return self[start ... end]
    }
    subscript (bounds: PartialRangeThrough<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ... end]
    }
    subscript (bounds: PartialRangeUpTo<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ..< end]
    }
}
