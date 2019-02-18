//
//  AlgorithmView.swift
//  Algorithms
//
//  Created by Maciej Kowalski on 17/02/2019.
//  Copyright © 2019 Maciej Kowalski. All rights reserved.
//

import UIKit

class AlgorithmView: UIView {
    
    private var itemLayers = [CALayer]()
    private var sortingSteps = [(Int, Int)]()
    
    var dataSource: AlgorithmDataSource? {
        didSet {
            setNeedsDisplay()
        }
    }
    var delegate: AlgorithmDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        guard let dataSource = dataSource else {
            print("No data source, nothing to draw")
            return
        }
        let items = dataSource.items
        drawItems(rect, items: items)
        getSortingSteps(items: items)
    }
    
    private func drawItems(_ rect: CGRect, items: [SortingItem]) {
        let itemWidth = rect.width / CGFloat(items.count)
        
        for (i, item) in items.enumerated() {
            let rect = CGRect(x: 0, y: 0, width: itemWidth, height: -rect.height * CGFloat(item.value))
            let path = UIBezierPath(rect: rect)
            
            let layer = CAShapeLayer()
            layer.fillColor = item.color.cgColor
            layer.path = path.cgPath
            layer.position = CGPoint(x: CGFloat(i) * itemWidth, y: frame.maxY)
            itemLayers.append(layer)
            
            self.layer.addSublayer(layer)
        }
    }
    
    func getSortingSteps(items: [SortingItem]) {
        sortingSteps = SortingAlgorithm.bubbleSort(items: items)
    }
    
    
    
    func animateSorting() {
        animate(index: 0)
        
    }
    
    func animate(index: Int) {
        if index < 0 || index == sortingSteps.count { return }
        let step = sortingSteps[index]
        let animation = AlgorithmAnimation(layer1: itemLayers[step.0], layer2: itemLayers[step.1])
        animation.run(withDuration: 0.1) { [weak self] _ in
            self?.itemLayers.swapAt(step.0, step.1)
            self?.animate(index: index + 1)
        }
    }
    
}
