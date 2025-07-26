//
//  ViewController.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 02/04/20.
//  Copyright © 2020 Shivam Jaiswal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let medianFinder = MedianFinder()
        
        medianFinder.addNum(-1);
        print(medianFinder.findMedian())
        medianFinder.addNum(-2);
        print(medianFinder.findMedian())
        medianFinder.addNum(-3);
        print(medianFinder.findMedian())
        medianFinder.addNum(-4);
        print(medianFinder.findMedian())
        medianFinder.addNum(-5);
        print(medianFinder.findMedian())
    }
}

class MedianFinder {
    // maxHeap stores the smaller half (max at top)
    private let maxHeap = Heap<Int>(ordering: .max)
    // minHeap stores the larger half (min at top)
    private let minHeap = Heap<Int>(ordering: .min)
    
    init() {
        // No initialization needed
    }
    
    func addNum(_ num: Int) {
        // Simple strategy: Always try to add to maxHeap first
        // Then balance if needed
        
        if maxHeap.isEmpty || num <= maxHeap.peek! {
            maxHeap.insert(num)
        } else {
            minHeap.insert(num)
        }
        
        // Balance the heaps to maintain size constraint
        balanceHeaps()
    }
    
    func findMedian() -> Double {
        if maxHeap.size > minHeap.size {
            // Odd total count, median is maxHeap's top
            return Double(maxHeap.peek!)
        } else {
            // Even total count, median is average of both tops
            return Double(maxHeap.peek! + minHeap.peek!) / 2.0
        }
    }
    
    private func balanceHeaps() {
        // Maintain invariant: maxHeap.size >= minHeap.size
        // and maxHeap.size <= minHeap.size + 1
        
        if maxHeap.size > minHeap.size + 1 {
            // maxHeap has too many elements, move one to minHeap
            if let element = maxHeap.delete() {
                minHeap.insert(element)
            }
        } else if minHeap.size > maxHeap.size {
            // minHeap has more elements, move one to maxHeap
            if let element = minHeap.delete() {
                maxHeap.insert(element)
            }
        }
    }
    
    // Helper methods for debugging
    func getHeapSizes() -> (maxHeapSize: Int, minHeapSize: Int) {
        return (maxHeap.size, minHeap.size)
    }
    
    func getHeapTops() -> (maxHeapTop: Int?, minHeapTop: Int?) {
        return (maxHeap.peek, minHeap.peek)
    }
}
