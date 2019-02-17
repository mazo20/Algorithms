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
    }
    
    private func drawItems(_ rect: CGRect, items: [SortingItem]) {
        let itemWidth = rect.width / CGFloat(items.count)
        
        for (i, item) in items.enumerated() {
            let rect = CGRect(x: CGFloat(i) * itemWidth, y: rect.height, width: itemWidth, height: -rect.height * CGFloat(item.value))
            let path = UIBezierPath(rect: rect)
            
            let layer = CAShapeLayer()
            layer.fillColor = item.color.cgColor
            layer.path = path.cgPath
            itemLayers.append(layer)
            
            self.layer.addSublayer(layer)
        }
    }
    
    func animateLayer() {
        let layer = itemLayers[20]
        let newPosition = CGPoint(x: layer.position.x - 100, y: layer.position.y - 100)
        let animation = AlgorithmAnimation(layer: layer, from: layer.position, to: newPosition)
        animation.run(withDuration: 5) { _ in
            print("Animation completed")
        }
    }
    
}
