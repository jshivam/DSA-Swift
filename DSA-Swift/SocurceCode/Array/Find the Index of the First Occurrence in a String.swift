//
//  Find the Index of the First Occurrence in a String.swift
//  DSA-Swift
//
//  Created by FitBudd on 27/03/24.
//  Copyright © 2024 Shivam Jaiswal. All rights reserved.
//


class Find_the_Index_of_the_First_Occurrence_in_a_String: Executable {
    func excecute() {
//        print(strStr("mississippi", "issip"))
//        print(isPalindrome("race a car"))
//        print(wordPattern("abba", "dog cat cat fish"))
//        print(summaryRanges([0,1,2,4,5,7]))
//        var nums = [0,0,1,1,1,1,2,3,3]
//        print(removeDuplicatesII(&nums))
//        print(hIndex([1,2,3,4,5]))
//        print(convert("ABCD", 2))
        
        print(insert([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,8]))
        //[4,5]/[2,5]/[0,5]/[4,6]/[4,10]/[2,7]/[2,10]/[0,7]
    }
    
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        
        var mergedInterval = intervals
        
        for index in 0...(intervals.count - 2) {
            var leftItem = intervals[index]
            var rightItem = intervals[index + 1]
            
            if leftItem[1] < newInterval[0] && rightItem[0] > newInterval[1] {
                mergedInterval.insert(newInterval, at: index + 1)
                break
            }
            
            
            if leftItem[1] >= newInterval[0] && rightItem[0] > newInterval[1] {
                if leftItem[0] < newInterval[0] {
                    leftItem[1] = newInterval[1]
                    mergedInterval[index] = leftItem
                } else {
                    mergedInterval[index] = newInterval
                }
                break
            }
            
            if leftItem[1] < newInterval[0] && rightItem[0] <= newInterval[1] {
                if rightItem[1] > newInterval[1] {
                    rightItem[0] = newInterval[0]
                    mergedInterval[index + 1] = rightItem
                } else {
                    mergedInterval[index + 1] = newInterval
                }
                break
            }
            
            if leftItem[0] < newInterval[0] && leftItem[1] > newInterval[0] {
                if leftItem[0] < newInterval[0] {
                    leftItem[1] = rightItem[1]
                    mergedInterval[index] = leftItem
                    mergedInterval.remove(at: index + 1)
                } else {
                    leftItem[1] = newInterval[1]
                    mergedInterval[index] = leftItem
                    mergedInterval.remove(at: index + 1)
                }
                break
            }
            
            if rightItem[0] < newInterval[1] && rightItem[1] > newInterval[1] {
                rightItem[0] = newInterval[0]
                mergedInterval[index + 1] = rightItem
                mergedInterval.remove(at: index)
                break
            }
        }

        return mergedInterval
        
        
        /*
         
         [[1,3], [6,9]] => [4,5]/[2,5]/[0,5]/[4,6]/[4,10]/[2,7]/[2,10]/[0,7]
        
         if upperbound of left item < lowerbound of the newInterval && lowerBound of the right item > upper bound of newInterval              insert as it is
         
         if upperbound of left item >= lowerbound of the newInterval && lowerBound of the right item > upper bound of newInterval
            if lowerbound of left item < lowerbound of the newInterval
                replace upperbound of left item with upperbound of new interval
            else
                relace left item with new interval
         
         if upperbound of left item < lowerbound of the newInterval && lowerBound of the right item <= upper bound of newInterval
             if upperbound of right item > upperbound of the newInterval
                 replace lowerbound of the right item with lowerbound of the newInterval
             else
                 relace right item with new interval
         
         if lowerbound of left item < lowerbound of newInterval && upperbound of left item > lowerbound of newInterval
            if lowerbound of left < lowerbound of newInterval
                replace upperbound of left item with upperbound of rightItem
                delete right item
            else
                replace upperbound of left item with upperbound of newInterval
                delete right item
         
         
         if lowerbound of right item < upperbound of newInterval && upperbound of right item > upperbound of newInterval
            replace lowerbound of right item with lowerbound of newitem
            delte left item
        */
        
        
        
    }
    
    func convert(_ s: String, _ numRows: Int) -> String {
        var zigZag = [[String]]()
        for _ in 1...numRows{
            zigZag.append([String("")])
        }
        
        let stringArray = Array(s)
        var rowNum = 0
        var shouldGoDown = true
        
        for char in stringArray {
            if shouldGoDown {
                var rowVal = zigZag[rowNum]
                rowVal.append(String(char))
                zigZag[rowNum] = rowVal
                rowNum += 1
                
                if numRows <= 2 {
                    rowNum = rowNum % numRows
                    continue
                }
                
                if rowNum == numRows   {
                    shouldGoDown = false
                    rowNum = rowNum - 2
                }
                
            } else {
                var rowVal = zigZag[rowNum]
                rowVal.append(String(char))
                zigZag[rowNum] = rowVal
                rowNum -= 1
                
                if rowNum <= 0   {
                    shouldGoDown = true
                    rowNum = 0
                }
            }
        }
        
        let result = String((zigZag.flatMap { $0 }).flatMap({ $0 }))
        
        return result
    }
    
    func strStr(_ haystack: String, _ needle: String) -> Int {

        let arrayNeedle = Array(needle)
        var indexNeedle = 0
        var indexHaystack = 0
        for charHaystack in haystack {
            if indexNeedle == arrayNeedle.endIndex {
                return indexHaystack - arrayNeedle.count
            }

            if charHaystack == arrayNeedle[indexNeedle] {
                indexNeedle += 1
            } else {
                indexNeedle = 0
                if charHaystack == arrayNeedle[indexNeedle] {
                    indexNeedle += 1
                }
            }

            indexHaystack += 1
        }

        if indexNeedle == arrayNeedle.endIndex {
            return indexHaystack - arrayNeedle.count
        }

        return -1
        
    }
    
    func isPalindrome(_ s: String) -> Bool {
        let array = Array(s)
        var start = 0
        var end = array.count - 1
        let alphanumeric = "abcdefghijklmnopqrstuvwxyz1234567890"

        while (start < end) {
            let valStart = array[start].lowercased()
            let valEnd = array[end].lowercased()

            if !alphanumeric.contains(valStart) {
                start += 1
                continue
            }

            if !alphanumeric.contains(valEnd) {
                end -= 1
                continue
            }

            if valStart == valEnd {
                start += 1
                end -= 1
            } else {
                return false
            }
        }

        return true
    }
    
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        let words = s.components(separatedBy: " ")
        let patternArray = Array(pattern)
        if words.count != patternArray.count {
            return false
        }
        
        var mapCharToWord = [Character : String]()
        var mapWordToChar = [String : Character]()
        
        for index in 0..<patternArray.count {
            let valChar = patternArray[index]
            let valWord = words[index]
            
            if let mappedWord = mapCharToWord[valChar], mappedWord != valWord {
                return false
            }
            
            if let mappedChar = mapWordToChar[valWord], mappedChar != valChar {
                return false
            }
            
            mapCharToWord[valChar] = valWord
            mapWordToChar[valWord] = valChar
            
        }
        
        return true
    }
    
    func summaryRanges(_ nums: [Int]) -> [String] {
        guard !nums.isEmpty else { return [] }
        var res = [String]()
        var start = 0
        var end = 0
        var expectedValue = 0
        for (index, item) in nums.enumerated() {
            if index == 0 {
                start = item
                end = item
                expectedValue = start + 1
                continue
            }

            if expectedValue == item {
                expectedValue += 1
                end = item
                continue
            }
            
            if start == end {
                res.append("\(start)")
            } else {
                res.append("\(start)->\(end)")
            }
            
            start = item
            end = item
            expectedValue = start + 1
        }
        
        if start == end {
            res.append("\(start)")
        } else {
            res.append("\(start)->\(end)")
        }
        return res
    }
    
    func removeDuplicatesII(_ nums: inout [Int]) -> Int {
        var i = 0
        let maxAppearance = 2
        for item in nums {
            if i < maxAppearance || item != nums[i - maxAppearance] {
                nums[i] = item
                i += 1
            }
        }
        return i
    }
    
    func hIndex(_ citations: [Int]) -> Int {
        let sortedCitations = citations.sorted {$0 > $1}

        var i = 0
        var hIndex = 0

        while i < sortedCitations.count {
            if sortedCitations[i] > i {
                hIndex = i + 1
            }

            i += 1
        }

        return hIndex
    }
}
