//
//  SortingAlgorithm.swift
//  Algorithms
//
//  Created by Maciej Kowalski on 17/02/2019.
//  Copyright © 2019 Maciej Kowalski. All rights reserved.
//

import Foundation

struct SortingAlgorithm {
    
    static func bubbleSort(items: [SortingItem]) -> [(Int, Int)] {
        var sortedItems = items
        var swaps = [(Int, Int)]() //Array of indices of layers to swap
        for i in 0..<sortedItems.count-1 {
            for j in 0..<sortedItems.count-1-i {
                //compare(j, j+1)
                if sortedItems[j] > sortedItems[j+1] {
                    sortedItems.swapAt(j, j+1)
                    //swap(j, j+1)
                    swaps.append((j, j+1))
                }
            }
        }
        return swaps
    }
}
