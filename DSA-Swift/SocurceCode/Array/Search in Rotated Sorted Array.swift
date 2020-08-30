//
//  Search in Rotated Sorted Array.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 30/08/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

class Search_in_Rotated_Sorted_Array: Executable {
    func excecute() {
        print(search([], 3))
    }
    
    func search(_ nums: [Int], _ target: Int) -> Int {
        let pivot = findPivot(nums, start: 0, end: nums.count - 1)
        if pivot == -1 {
            return binarySearch(nums, start: 0, end: nums.count - 1, target: target)
        }
        else if nums[pivot] == target {
            return pivot
        }
        else if (nums[pivot] < target) && (target < nums[0]) {
            return binarySearch(nums, start: pivot + 1, end: nums.count - 1, target: target)
        } else {
            return binarySearch(nums, start: 0, end: pivot - 1, target: target)
        }
    }
    
    func binarySearch(_ nums: [Int], start: Int, end: Int, target: Int) -> Int {
        var start = start
        var end = end
                
        while start <= end {
            let mid = (start + end)/2

            if nums[mid] == target {
                return mid
            }
            
            if nums[mid] < target {
                start = mid + 1
            }
            
            if nums[mid] > target {
                end = mid - 1
            }
        }
        
        return -1
    }
    
    func findPivot(_ nums: [Int], start: Int, end: Int) -> Int {
        if start > end {
            return -1
        }
        
        if start == end {
            return start
        }
        
        let mid = (start + end) / 2
        if (mid < end) && (nums[mid] > nums[mid + 1]) {
            return mid + 1
        }
        
        if (mid > start) && (nums[mid] < nums[mid - 1]) {
            return mid
        }
        
        if nums[start] > nums[mid] {
            return findPivot(nums, start: start, end: mid - 1)
        } else if nums[end] < nums[mid] {
            return findPivot(nums, start: mid + 1, end: end)
        }
        
        return -1
    }
}
