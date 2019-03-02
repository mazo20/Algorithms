//
//  AlgorithmModel.swift
//  Algorithms
//
//  Created by Maciej Kowalski on 19/02/2019.
//  Copyright © 2019 Maciej Kowalski. All rights reserved.
//

import UIKit

enum AlgorithmModel {
    
    static let allCases: [AlgorithmModel] = [.bubbleSort, .insertionSort, .quickSort, .heapSort, .mergeSort, .selectionSort, .shellSort, .slowSort]
    
    case insertionSort
    case selectionSort
    case mergeSort
    case shellSort
    case quickSort
    case heapSort
    case introSort
    case countingSort
    case radixSort
    case topologicalSort
    case bubbleSort
    case slowSort
    
    var subtitle: String? {
        switch self {
        case .bubbleSort:
            return "Compares adjacent values"
        case .insertionSort:
            return "Inserts value in a correct spot"
        case .quickSort:
            return "Move all bigger values to one side of the pivot, smaller to the other"
        case .heapSort:
            return "Use heap to find biggest value and put it to the end"
        case .mergeSort:
            return "Divide the array into small parts, sort and combine them"
        default:
            return nil
        }
    }
    
    var title: String {
        switch self {
        case .bubbleSort:
            return "Bubble sort"
        case .insertionSort:
            return "Insertion sort"
        case .quickSort:
            return "Quicksort"
        case .heapSort:
            return "Heapsort"
        case .mergeSort:
            return "Merge sort"
        case .selectionSort:
            return "Selection sort"
        case .shellSort:
            return "Shell sort"
        default:
            return "Not implemented"
        }
    }
    
    var description: String {
        switch self {
        case .bubbleSort:
            return "Bubble sort is a simple algorithm that repeatedly steps through the list, compares adjacent pairs and swaps them if they are in the wrong order. This happens until the list is sorted."
        case .insertionSort:
            return "Insertion sort is a simple algorithm that repeatedly chooses value from the list and inserts it into the already partialy sorted array."
        case .quickSort:
            return "Quicksort is an efficient divide-and-conquer sorting algorithm that divides a large array into two smaller sub-arrays: the low elements and the high elements. Quicksort can then recursively sort the sub-arrays."
        case .heapSort:
            return "Heapsort is a efficient sorting algorithm that can be thought as an improved version of selection algorithm. It divides the array into a sorted and unsorted region and moves the biggest value from the unsorted region to the sorted region, shrinking search area. Uses heap data structre instead the linear search to find maximum value"
        case .mergeSort:
            return "Merge sort is an efficient divide-and-conquer sorting algorithm that recuresively divides arrays into two smaller arrays. In second step it merges each two sorted arrays bottom to top to produce final result."
        case .selectionSort:
            return "Selection sort is a simple sorting algorithm that is a slower version of heapsort. It divides the array into a sorted and unsorted region and moves the biggest value from the unsorted region to the sorted region, shrinking search area. Uses linear search to find the biggest value"
        case .shellSort:
            return "Shell sort is an efficient sorting algorithm that sorts values far apart from each other and then progressively reduces the gap between values to be compared. "
        default:
            return "Not implemented"
        }
    }
    
    var color: UIColor {
        switch self {
        case .bubbleSort:
            return #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        case .insertionSort:
            return #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        case .quickSort:
            return #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        case .heapSort:
            return #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        case .mergeSort:
            return #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
        case .selectionSort:
            return #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        case .shellSort:
            return #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        default:
            return #colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1)
        }
    }
    
    
    
    var worstCase: String {
        switch self {
        case .bubbleSort:
            return "O(n^2)"
        case .insertionSort:
            return "O(n^2)"
        case .quickSort:
            return "O(n^2)"
        case .heapSort:
            return "O(nlog(n))"
        case .mergeSort:
            return "O(nlog(n))"
        case .selectionSort:
            return "O(n^2)"
        case .shellSort:
            return "O(n^4/3)"
        default:
            return "Not implemented"
        }
    }
    
    var worstCaseName: String {
        return "Worst case"
    }
    
    var averageCase: String {
        switch self {
        case .bubbleSort:
            return "O(n^2)"
        case .insertionSort:
            return "O(n^2)"
        case .quickSort:
            return "O(nlog(n))"
        case .heapSort:
            return "O(nlog(n))"
        case .mergeSort:
            return "O(nlog(n))"
        case .selectionSort:
            return "O(n^2)"
        case .shellSort:
            return "O(nlog(n))"
        default:
            return "Not implemented"
        }
    }
    
    var averageCaseName: String {
        return "Average case"
    }
    
    var bestCase: String {
        switch self {
        case .bubbleSort:
            return "O(n)"
        case .insertionSort:
            return "O(n)"
        case .quickSort:
            return "O(nlog(n))"
        case .heapSort:
            return "O(nlog(n))"
        case .mergeSort:
            return "O(nlog(n))"
        case .selectionSort:
            return "O(n^2)"
        case .shellSort:
            return "O(nlog(n))"
        default:
            return "Not implemented"
        }
    }
    
    var bestCaseName: String {
        return "Best case"
    }
    
    var stable: String {
        switch self {
        case .bubbleSort:
            return "Yes"
        case .insertionSort:
            return "Yes"
        case .quickSort:
            return "No"
        case .heapSort:
            return "No"
        case .mergeSort:
            return "Yes"
        case .selectionSort:
            return "No"
        case .shellSort:
            return "No"
        default:
            return "Not implemented"
        }
    }
    
    var stableName: String {
        return "Stable"
    }
    
}
