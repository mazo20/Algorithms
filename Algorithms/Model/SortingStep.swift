//
//  SortingStep.swift
//  Algorithms
//
//  Created by Maciej Kowalski on 21/02/2019.
//  Copyright © 2019 Maciej Kowalski. All rights reserved.
//

import Foundation

struct SortingStep {
    enum StepType {
        case swap
        case highlight
    }
    
    let type: StepType
    let swapPosition: (Int, Int)?
    let highlightPosition: Int?
    
    init(swap: (Int, Int)) {
        self.type = .swap
        self.swapPosition = swap
        self.highlightPosition = nil
    }
    
    init(highlight: Int) {
        self.type = .highlight
        self.swapPosition = nil
        self.highlightPosition = highlight
    }
    
}
