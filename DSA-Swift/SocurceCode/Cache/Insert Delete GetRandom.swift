//
//  Insert Delete GetRandom.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 11/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

/**
* Your RandomizedSet object will be instantiated and called as such:
* let obj = RandomizedSet()
* let ret_1: Bool = obj.insert(val)
* let ret_2: Bool = obj.remove(val)
* let ret_3: Int = obj.getRandom()
*/

class RandomizedSet {
    private var map = [Int : Int]()
    private var count = 0
    private var values = [Int]()

    /** Initialize your data structure here. */
    init() {

    }

    /** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
    func insert(_ val: Int) -> Bool {
        guard !doesExists(val) else { return false }
        map[val] = count
        values.append(val)
        count += 1
        return true
    }

    /** Removes a value from the set. Returns true if the set contained the specified element. */
    func remove(_ val: Int) -> Bool {
        guard doesExists(val) else { return false}
        let index = map[val]!
        count -= 1
        let lastValue = values[count]
        map[lastValue] = index
        values.swapAt(index, count)
        values.removeLast()
        map[val] = nil
        return true
    }

    /** Get a random element from the set. */
    func getRandom() -> Int {
        guard count > 0 else { return -1 }
        let randomIndex = Int.random(in: 0..<count)
        return values[randomIndex]
    }

    private func doesExists(_ val: Int) -> Bool {
        return map[val] == nil ? false : true
    }
}
