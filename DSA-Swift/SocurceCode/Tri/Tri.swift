//
//  Tri.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 13/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

class Tri<Item: Sequence> where Item.Element: Hashable{
    private let root = TriNode()

    func add(_ item: Item) {
        var prev = root
        for element in item {
            if let node = prev.childrens[element] {
                prev = node
            } else{
                let node = TriNode()
                prev.childrens[element] = node
                prev = node
            }
        }
        prev.endOfNode = true
        prev.count += 1
    }

    /// Returns the cont of item, will return `0` if not found
    func search(_ item: Item) -> Int {
        return navigateTillEnd(item)?.count ?? 0
    }

    /// TODO:
    func delete(_ item: Item) -> Bool {
        fatalError("This feature has not been implemented yet")
    }

    private func navigateTillEnd(_ item: Item) -> TriNode? {
        var prev = root
        for element in item {
            guard let node = prev.childrens[element] else { return nil }
            prev = node
        }
        return prev
    }
}

extension Tri {
    class TriNode {
        var count = 0
        var endOfNode = false
        var childrens = [Item.Element : TriNode]()
    }
}

