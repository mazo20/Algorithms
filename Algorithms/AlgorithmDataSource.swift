//
//  AlgorithmDataSource.swift
//  Algorithms
//
//  Created by Maciej Kowalski on 17/02/2019.
//  Copyright © 2019 Maciej Kowalski. All rights reserved.
//

import UIKit

class AlgorithmDataSource {
    
    let type: AlgorithmType
    let numberOfItems: Int
    var items = [SortingItem]()
    
    
    var animationSteps = [AlgorithmAnimation]()
    
    init(type: AlgorithmType, numberOfItems: Int) {
        self.type = type
        self.numberOfItems = numberOfItems
        
        generateItems()
    }
    
    
    
    
    private func generateItems() {
        for i in 1...numberOfItems {
            //Height from 0 to 1
            let height = Double(i)/Double(numberOfItems)
            let color = colorFor(value: height)
            let item = SortingItem(value: height, color: color)
            items.append(item)
        }
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
