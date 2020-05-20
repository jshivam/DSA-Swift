//
//  Delete Products.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 12/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

/**
 Find minimum number of distinct elements after removing m items .
 Given an array of items, an i-th index element denotes the item id’s and given a number m, the task is to remove m elements such that there should be minimum distinct id’s left. Print the number of distinct id’s.

     Input : arr[] = { 2, 2, 1, 3, 3, 3}
     m = 3
     Output : 1
     Remove 1 and both 2's.So, only 3 will be left that's why distinct id is 1.

     Input : arr[] = { 2, 4, 1, 5, 3, 5, 1, 3}
     m = 2
     Output : 3
     Remove 2 and 4 completely. So, remaining ids are 1, 3 and 5 i.e. 3

*/

class Delete_Products: Executable {
    func excecute() {
        print(deleteProducts(ids: [2, 4, 1, 5, 3, 5, 1, 3], m: 2))
    }

    func deleteProducts(ids: [Int], m: Int) -> Int {
        var hashMap = [Int : Int]()
        for item in ids { hashMap[item, default: 0] += 1 }
        var count = m
        var result = hashMap.count
        for (_, value) in hashMap.sorted(by: {$0.value < $1.value}) {
            if value <= count {
                result -= 1
                count -= value
            } else {
                break
            }
        }
        return result
    }
}
