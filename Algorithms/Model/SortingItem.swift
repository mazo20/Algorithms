//
//  SortingItem.swift
//  Algorithms
//
//  Created by Maciej Kowalski on 17/02/2019.
//  Copyright © 2019 Maciej Kowalski. All rights reserved.
//

import UIKit

struct SortingItem: Comparable {
    
    let value: Double
    let color: UIColor
    
    init(value: Double, color: UIColor) {
        self.value = value
        self.color = color
    }
    
    static func < (lhs: SortingItem, rhs: SortingItem) -> Bool {
        return lhs.value < rhs.value
    }
    
}
