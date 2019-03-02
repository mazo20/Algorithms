//
//  AlgorithmDataSource.swift
//  Algorithms
//
//  Created by Maciej Kowalski on 17/02/2019.
//  Copyright © 2019 Maciej Kowalski. All rights reserved.
//

import UIKit

class AlgorithmDataSource {
    
    let sortingType: AlgorithmModel
    let numberOfItems: Int
    
    var items = [SortingItem]()
    private var steps = [SortingStep]()
    private var currentMode: AlgorithmMode = .sorting
    
    private enum AlgorithmMode {
        case sorting
        case shuffling
    }
    
    var nextStep: SortingStep? {
        guard !steps.isEmpty else {
            print("No more sorting steps")
            return nil
        }
        let step = steps.removeFirst()
        if let (i, j) = step.swapPosition {
            items.swapAt(i, j)
        }
        return step
    }
    
    
    init(type: AlgorithmModel, numberOfItems: Int) {
        self.sortingType = type
        self.numberOfItems = numberOfItems
        
        self.items = generateItems(numberOfItems)
    }
    
    func sortItems() {
        if currentMode == .sorting && !steps.isEmpty {
            return
        }
        currentMode = .sorting
        (steps, _) = SortingAlgorithm.sort(items: items, with: sortingType)
    }
    
    func shuffleItems() {
        if currentMode == .shuffling && !steps.isEmpty { return }
        currentMode = .shuffling
        (steps, _) = SortingAlgorithm.shuffle(items: items)
    }
    
    private func generateItems(_ number: Int) -> [SortingItem] {
        //Generate n items with height from 0 to 1 and assign each of them a color. Shuffle at the end so that it's not sorted
        var items = [SortingItem]()
        for i in 1...number {
            //Height from 0 to 1
            let height = Double(i)/Double(number)
            let color = colorFor(value: height)
            let item = SortingItem(value: height, color: color)
            items.append(item)
        }
        items.shuffle()
        return items
    }
    
    private func colorFor(value: Double) -> UIColor {
        //Based on the height it return a color. Colors start with red, goes through green, blue and end with red.
        //Color values range from 0 to 255, but there are 3! possibilities of colors so 255 * 6 is range of colors.
        let height = Int(value * 255 * 6)
        var color = (red: 0, green: 0, blue: 0)
        let range = 256
        switch height {
        case 0..<range:
            color = (255, height % 256, 0)
        case range..<range * 2:
            color = (255 - height % 256, 255, 0)
        case range * 2..<range * 3:
            color = (0, 255, height % 256)
        case range * 3..<range * 4:
            color = (0, 255 - height % 256, 255)
        case range * 4..<range * 5:
            color = (height % 256, 0, 255)
        default:
            color = (255, 0, 255 - height % 256)
        }
        return UIColor(red: CGFloat(color.red)/255,
                       green: CGFloat(color.green)/255,
                       blue: CGFloat(color.blue)/255,
                       alpha: 1)
    }
}
