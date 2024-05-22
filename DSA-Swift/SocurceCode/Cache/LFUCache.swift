//
//  LFUCache.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 17/05/24.
//  Copyright © 2024 Shivam Jaiswal. All rights reserved.
//

import Foundation

class LFUCache {
    private let capacity: Int
    private var cache: [Int: (value: Int, freq: Int)]
    private var minimumFreq: Int
    private var freqCache: [Int: LRUCache<Int>]

    init(_ capacity: Int) {
        self.capacity = capacity
        self.cache = [:]
        self.minimumFreq = 0
        self.freqCache = [:]
    }
    
    func get(_ key: Int) -> Int {
        guard capacity > 0, let chaceItem = cache[key], let lruCache = freqCache[chaceItem.freq] else { return -1 }
        lruCache.delete(key: key)
        
        if minimumFreq == chaceItem.freq && lruCache.isEmpty {
            freqCache[minimumFreq] = nil
            minimumFreq += 1
        }
        
        update(key: key, value: chaceItem.value, freq: chaceItem.freq + 1)
        
        return chaceItem.value
    }
    
    func put(_ key: Int, _ value: Int) {
        if let cacheItem = cache[key] {
            cache[key] = (value, cacheItem.freq)
            let _ = get(key)
        } else {
            if capacity == cache.count, let lruCache = freqCache[minimumFreq], let droppedKey = lruCache.dropLRUCache() {
                cache[droppedKey] = nil
            }
            minimumFreq = 1
            update(key: key, value: value, freq: 1)
        }
    }
    
    private func update(key: Int, value: Int, freq: Int) {
        cache[key] = (value, freq)
        
        if let lruCache = freqCache[freq] {
            lruCache.set(value: value, for: key)
        } else {
            let lruCache = LRUCache<Int>(size: capacity)
            lruCache.set(value: value, for: key)
            freqCache[freq] = lruCache
        }
    }
}
