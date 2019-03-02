//
//  Pressable.swift
//  Algorithms
//
//  Created by Maciej Kowalski on 17/02/2019.
//  Copyright © 2019 Maciej Kowalski. All rights reserved.
//

import Foundation

protocol ButtonDelegate {
    func buttonPressed(withTag: Int)
}

protocol SegmentedControlDelegate {
    func valueDidChange(to: Int)
}
