//
//  Frequencies of array elements in range 1 to n.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 12/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

class Frequencies_of_array_elements_in_range_1_to_n: Executable {

    func excecute() {
        print(frequencies([4, 4, 4, 4]))
    }

    func frequencies(_ numbers: [Int]) -> [Int] {
        guard !numbers.isEmpty else { return [] }
        let size = numbers.count
        var numbers = numbers.map { $0 - 1 }
        for (index, _) in numbers.enumerated() {
            numbers[numbers[index] % size] += size
        }
        numbers = numbers.map{ $0 / size }
        return numbers
    }
}
