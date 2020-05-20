//
//  Group Anagrams.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 22/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit
/**
 Given an array of strings, group anagrams together.

 Example:

        Input: ["eat", "tea", "tan", "ate", "nat", "bat"]

        Output:
        [
            ["ate","eat","tea"],
            ["nat","tan"],
            ["bat"]
        ]
 Note:
 All inputs will be in lowercase.
 The order of your output does not matter.
*/
class Group_Anagrams: Executable {
    func excecute() {
        print(groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]))
    }

    func groupAnagrams(_ strs: [String]) -> [[String]] {

        var list = [[Character : Int] : [String]]()

        for string in strs {
            let hashValue = string.hashValue
            list[hashValue] = [string] + (list[hashValue] ?? [])
        }

        return Array(list.values)
    }
}

private extension String {
    var hashValue: [Character : Int] {
        var map = [Character : Int]()
        for item in self {
            map[item] = (map[item] ?? 0) + 1
        }
        return map
    }
}
