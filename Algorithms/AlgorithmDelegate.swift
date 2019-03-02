//
//  AlgorithmDelegate.swift
//  Algorithms
//
//  Created by Maciej Kowalski on 17/02/2019.
//  Copyright © 2019 Maciej Kowalski. All rights reserved.
//

import UIKit

class AlgorithmDelegate: ButtonDelegate, SegmentedControlDelegate {
    
    var algorithmView: AlgorithmView?
    var toolbarView: ToolbarView?
    private var isAnimating = false
    
    func buttonPressed(withTag tag: Int) {
        switch tag {
        case 0:
            print("Shuffle button presesed")
            algorithmView?.shuffle()
            isAnimating = false
            toolbarView?.rightButton.setTitle("Sort", for: .normal)
        case 1:
            if isAnimating {
                isAnimating = false
                toolbarView?.rightButton.setTitle("Sort", for: .normal)
                algorithmView?.stopAnimation()
            } else {
                isAnimating = true
                toolbarView?.rightButton.setTitle("Pause", for: .normal)
                algorithmView?.animateSorting()
            }
            
        default:
            print("Button with tag \(tag) not handled")
        }
        
    }
    
    func valueDidChange(to value: Int) {
        switch value {
        case 0:
            algorithmView?.animationSpeed = AnimationSpeed.slow
        case 1:
            algorithmView?.animationSpeed = AnimationSpeed.normal
        case 2:
            algorithmView?.animationSpeed = AnimationSpeed.fast
        default:
            return
        }
    }
    
    
    func sort() {
        
    }
    
    
}
