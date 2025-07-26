//
//  MedianFinder.swift
//  DSA-Swift
//
//  Created by Shivam Jaiswal on 26/07/25.
//  Copyright © 2025 Shivam Jaiswal. All rights reserved.
//

import Foundation
/**
 The median is the middle value in an ordered integer list. If the size of the list is even, there is no middle value, and the median is the mean of the two middle values.

 For example, for arr = [2,3,4], the median is 3.
 For example, for arr = [2,3], the median is (2 + 3) / 2 = 2.5.
 Implement the MedianFinder class:

 MedianFinder() initializes the MedianFinder object.
 void addNum(int num) adds the integer num from the data stream to the data structure.
 double findMedian() returns the median of all elements so far. Answers within 10-5 of the actual answer will be accepted.
  

        Example 1:

        Input
        ["MedianFinder", "addNum", "addNum", "findMedian", "addNum", "findMedian"]
        [[], [1], [2], [], [3], []]
        Output
         [null, null, null, 1.5, null, 2.0]

         Explanation
         MedianFinder medianFinder = new MedianFinder();
         medianFinder.addNum(1);    // arr = [1]
         medianFinder.addNum(2);    // arr = [1, 2]
         medianFinder.findMedian(); // return 1.5 (i.e., (1 + 2) / 2)
         medianFinder.addNum(3);    // arr[1, 2, 3]
         medianFinder.findMedian(); // return 2.0
          
         
         Constraints:

         -105 <= num <= 105
         There will be at least one element in the data structure before calling findMedian.
         At most 5 * 104 calls will be made to addNum and findMedian.
  

 Follow up:

 If all integer numbers from the stream are in the range [0, 100], how would you optimize your solution?
 If 99% of all integer numbers from the stream are in the range [0, 100], how would you optimize your solution?
*/
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
