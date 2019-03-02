//
//  SortingAlgorithm.swift
//  Algorithms
//
//  Created by Maciej Kowalski on 17/02/2019.
//  Copyright © 2019 Maciej Kowalski. All rights reserved.
//

import Foundation

struct SortingAlgorithm {
    
    static func sort(items: [SortingItem], with sorting: AlgorithmModel) -> ([SortingStep], [SortingItem]) {
        switch sorting {
        case .bubbleSort:
            return bubbleSort(items: items)
        case .insertionSort:
            return insertionSort(items: items)
        case .heapSort:
            return heapsort(items: items)
        case .quickSort:
            return quicksort(items: items)
        case .selectionSort:
            return selectionSort(items: items)
        case .shellSort:
            return shellSort(items: items)
        default:
            return ([], [])
        }
    }
    
    static func shuffle(items: [SortingItem]) -> ([SortingStep], [SortingItem]) {
        let count = items.count
        var steps = [SortingStep]()
        var sortedItems = items
        
        for i in 0..<count {
            let random = arc4random_uniform(UInt32(count))
            sortedItems.swapAt(i, Int(random))
            steps.append(SortingStep(swap: (i, Int(random))))
        }
        return (steps, sortedItems)
    }
    
    private static func bubbleSort(items: [SortingItem]) -> ([SortingStep], [SortingItem]) {
        var sortedItems = items
        var steps = [SortingStep]() //Array of indices of layers to swap
        for i in 0..<sortedItems.count-1 {
            for j in 0..<sortedItems.count-1-i {
                steps.append(SortingStep(highlight: j))
                if sortedItems[j] > sortedItems[j+1] {
                    sortedItems.swapAt(j, j+1)
                    steps.append(SortingStep(swap: (j, j+1)))
                }
            }
        }
        return (steps, sortedItems)
    }
    
    private static func insertionSort(items: [SortingItem]) -> ([SortingStep], [SortingItem]) {
        var sortedItems = items
        let count = sortedItems.count
        var steps = [SortingStep]()
        for i in 1..<count {
            var j = i
            while j > 0 {
                //compare(j, j-1)
                steps.append(SortingStep(highlight: j-1))
                if sortedItems[j-1] > sortedItems[j] {
                    sortedItems.swapAt(j, j-1)
                    steps.append(SortingStep(swap: (j, j-1)))
                } else {
                    break
                }
                j -= 1
            }
        }
        return (steps, sortedItems)
    }
    
    private static func selectionSort(items: [SortingItem]) -> ([SortingStep], [SortingItem]) {
        var sortedItems = items
        let count = sortedItems.count
        var steps = [SortingStep]()
        for i in 0..<count {
            var min = i
            for j in i..<count {
                steps.append(SortingStep(highlight: j))
                if sortedItems[j] < sortedItems[min] {
                    min = j
                }
            }
            sortedItems.swapAt(i, min)
            steps.append(SortingStep(swap: (i, min)))
        }
        return (steps, sortedItems)
    }
    
    private static func shellSort(items: [SortingItem]) -> ([SortingStep], [SortingItem]) {
        var sortedItems = items
        let count = sortedItems.count
        var steps = [SortingStep]()
        let gaps = [15, 10, 7, 5, 3, 1]
        for gap in gaps {
            for i in gap..<count {
                let temp = sortedItems[i]
                var j = i
                while j >= gap && sortedItems[j-gap] > temp {
                    steps.append(SortingStep(highlight: j))
                    sortedItems.swapAt(j, j-gap)
                    steps.append(SortingStep(swap: (j, j-gap)))
                    j -= gap
                }
                sortedItems[j] = temp
            }
        }
        return (steps, sortedItems)
    }
    
    private static func heapsort(items: [SortingItem]) -> ([SortingStep], [SortingItem]) {
        var sortedItems = items
        let count = sortedItems.count
        var steps = [SortingStep]()
        func shiftDown(start: Int, end: Int) {
            var root = start
            while root * 2 + 1 <= end {
                let child = root * 2 + 1
                var swap = root
                //compare(swap, child)
                //steps.append(SortingStep(highlight: swap))
                if sortedItems[swap] < sortedItems[child] {
                    swap = child
                }
                if child + 1 <= end {
                    //compare(swap, child + 1)
                    steps.append(SortingStep(highlight: swap))
                    if sortedItems[swap] < sortedItems[child + 1] {
                        swap = child + 1
                    }
                }
                guard swap != root else { return }
                sortedItems.swapAt(root, swap)
                steps.append(SortingStep(swap: (root, swap)))
                root = swap
            }
        }
        
        func heapify(count: Int) {
            var start = (count - 2) / 2
            while start >= 0 {
                shiftDown(start: start, end: count - 1)
                start -= 1
            }
        }
        
        heapify(count: count)
        var end = count - 1
        
        while end > 0 {
            sortedItems.swapAt(0, end)
            steps.append(SortingStep(swap: (0, end)))
            end -= 1
            
            shiftDown(start: 0, end: end)
        }
        
        return (steps, sortedItems)
    }
    
    private static func quicksort(items: [SortingItem]) -> ([SortingStep], [SortingItem]) {
        var sortedItems = items
        var steps = [SortingStep]()
        func quicksortMain(low: Int, high: Int){
            guard low < high else { return }
            let p = quicksortPartition(low: low, high: high)
            quicksortMain(low: low, high: p-1)
            quicksortMain(low: p+1, high: high)
        }
        
        func quicksortPartition(low: Int, high: Int) -> Int {
            let pivot = sortedItems[high]
            var i = low
            for j in low..<high {
                //compare(j, high)
                steps.append(SortingStep(highlight: j))
                if sortedItems[j] < pivot {
                    sortedItems.swapAt(i, j)
                    if i != j {
                        steps.append(SortingStep(swap: (i, j)))
                    }
                    i += 1
                }
            }
            sortedItems.swapAt(i, high)
            steps.append(SortingStep(swap: (i, high)))
            return i
        }
        func randHigh(min: Int, max: Int) -> Int {
            let k = Int(arc4random_uniform(UInt32(max-min))) + min
            return k
        }
        quicksortMain(low: 0, high: items.count-1)
        return (steps, sortedItems)
    }
    
    private static func radixSort(items: [SortingItem]) -> ([SortingStep], [SortingItem]) {
        var sortedItems = items
        var steps = [SortingStep]()
        let max = items.max()!
        
        func countSort(n: Int, exp: Int) {
            var tempItems = [SortingItem]()
            var count = Array(repeating: 0, count: 10)
            
            for i in 0..<n {
            }
        }
        
        
        return (steps, sortedItems)
    }
    
}


