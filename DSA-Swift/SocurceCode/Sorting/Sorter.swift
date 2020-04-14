//
//  Sorter.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 14/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

class Sorter<Item: Comparable> {
    func sort(_ items: [Item] , using sort: Sort) -> [Item] {
        switch sort {
        case .mergeSort:
            return mergeSort(items)
        }
    }
}

extension Sorter {
    enum Sort {
        case mergeSort
    }
}
