//
//  Contiguous Array.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 29/05/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit
/**
 Length of the largest subarray with contiguous elements. Given an array of distinct integers, find length of the longest subarray which contains numbers that can be arranged in a continuous sequence.

 Examples:

     Input:  arr[] = {10, 12, 11};
     Output: Length of the longest contiguous subarray is 3

     Input:  arr[] = {14, 12, 11, 20};
     Output: Length of the longest contiguous subarray is 2

     Input:  arr[] = {1, 56, 58, 57, 90, 92, 94, 93, 91, 45};
     Output: Length of the longest contiguous subarray is 5
*/

class Contiguous_Array: Executable {
    func excecute() {
//        print(shortestSubarray([1, 2], 2))
        SubSet.load()
    }

    func shortestSubarray(_ array: [Int], _ target: Int) -> Int {
        return 0
    }
}

class SubSet{
    let set: [Int]
    let sum: Int
    var solutionSet = [Int]()
    var hasSolution = false

    init(set: [Int], sum: Int) {
        self.set = set
        self.sum = sum
    }

    @discardableResult
    func solve(_ s: Int, _ idx: Int) -> Bool {
        //return false if s value exceed sum
        if(s > sum) {
            return false;
        }

        //check if stack has the right subsets of numbers
        if( s == sum ) {
            hasSolution = true;

            //display stack contents
            print(solutionSet);

            //Though found a solution but deliberately returning false to find more
            return false;
        }

        for i in idx..<set.count {
            //Adding element to the stack
            solutionSet.append(set[i]);

            //add set[i] to the 's' and recusively start from next number
            if( solve(s+set[i], i+1) ) {
                return true;
            }

            //Found false
            //Removing element from stack i.e Backtracking
            if !solutionSet.isEmpty {
                solutionSet.removeLast();
            }
        }

        //no Combination is equal to the sum value
        return false;
    }

    static func load() {
        let set = [10, 7, 5, 18, 12, 20, 15]
        let size = 30;

        let ss = SubSet(set: set, sum: size)
        ss.solve(0,0);
        if(ss.hasSolution == false) {
            print("No Solution");
        }
    }
}
