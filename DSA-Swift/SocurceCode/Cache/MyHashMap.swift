//
//  MyHashMap.swift
//  DSA-Swift
//
//  Created by FitBudd on 17/05/24.
//  Copyright © 2024 Shivam Jaiswal. All rights reserved.
//

import Foundation

class Pair<U, V> {
    var first: U
    var second: V
    
    init(_ first: U, _ second: V) {
        self.first = first
        self.second = second
    }
}

class Bucket {
    private var bucket: [Pair<Int, Int>]
    
    init() {
        self.bucket = []
    }
    
    func get(_ key: Int) -> Int {
        for pair in bucket {
            if pair.first == key {
                return pair.second
            }
        }
        return -1
    }
    
    func update(_ key: Int, _ value: Int) {
        var found = false
        for pair in bucket.indices {
            if bucket[pair].first == key {
                bucket[pair].second = value
                found = true
            }
        }
        
        if !found {
            bucket.append(Pair(key, value))
        }
    }
    
    func remove(_ key: Int) {
        for (index, pair) in bucket.enumerated() {
            if pair.first == key {
                bucket.remove(at: index)
                break
            }
        }
    }
}

class MyHashMap {
    private let keySpace: Int
    private var hashTable: [Bucket]
    
    init() {
        self.keySpace = 2069
        self.hashTable = Array(repeating: Bucket(), count: keySpace)
    }
    
    func put(_ key: Int, _ value: Int) {
        let hashKey = key % keySpace
        hashTable[hashKey].update(key, value)
    }
    
    func get(_ key: Int) -> Int {
        let hashKey = key % keySpace
        return hashTable[hashKey].get(key)
    }
    
    func remove(_ key: Int) {
        let hashKey = key % keySpace
        hashTable[hashKey].remove(key)
    }
}
