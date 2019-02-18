//
//  AlgorithmDelegate.swift
//  Algorithms
//
//  Created by Maciej Kowalski on 17/02/2019.
//  Copyright © 2019 Maciej Kowalski. All rights reserved.
//

import UIKit

class AlgorithmDelegate: ButtonDelegate {
    
    var algorithmView: AlgorithmView?
    
    func buttonPressed() {
        algorithmView?.animateSorting()
        
    }
    
    func sort() {
        
    }
    
    
}
