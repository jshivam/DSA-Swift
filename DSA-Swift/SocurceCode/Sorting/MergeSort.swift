//
//  MergeSort.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 13/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

extension Sorter {
    func mergeSort(_ items: [Item]) -> [Item] {
        guard items.count > 1 else { return items }

        let mid = items.count/2
        let left = mergeSort(Array(items[0...mid-1]))
        let right = mergeSort(Array(items[mid..<items.count]))
        return sortifyMerge(lhs: left, rhs: right)
    }

    private func sortifyMerge(lhs: [Item], rhs: [Item]) -> [Item] {
        let lhsCount = lhs.count
        let rhsCount = rhs.count
        var leftIndex = 0
        var rightIndex = 0
        var result = [Item]()

        while leftIndex < lhsCount && rightIndex < rhsCount {
            let leftItem = lhs[leftIndex]
            let rightItem = rhs[rightIndex]

            if leftItem < rightItem {
                result.append(leftItem)
                leftIndex += 1
            } else {
                result.append(rightItem)
                rightIndex += 1
            }
        }

        if leftIndex < lhsCount {
            result.append(contentsOf: Array(lhs[leftIndex..<lhsCount]))
        } else if rightIndex < rhsCount {
            result.append(contentsOf: Array(rhs[rightIndex..<rhsCount]))
        }

        return result
    }
}

