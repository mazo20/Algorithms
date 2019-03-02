//
//  AlgorithmView.swift
//  Algorithms
//
//  Created by Maciej Kowalski on 17/02/2019.
//  Copyright © 2019 Maciej Kowalski. All rights reserved.
//

import UIKit

class AlgorithmView: UIView {
    
    private var itemLayers = [CAShapeLayer]()
    private var currentAnimation: Animatable?
    
    private var isSorting = true
    private var isAnimating = false
    
    
    
    var dataSource: AlgorithmDataSource? {
        didSet {
            setNeedsDisplay()
        }
    }
    var animationSpeed: AnimationSpeed = .normal {
        didSet {
            //animateSorting()
        }
    }
    
    private var animationDuration: CFTimeInterval {
        switch animationSpeed {
        case .slow:
            return 0.5
        case .normal:
            return 0.2
        case .fast:
            return 0.02
        }
    }
    
    private var animationDelay: CFTimeInterval {
        switch animationSpeed {
        case .slow:
            return animationDuration
        case .normal:
            return animationDuration/4
        case .fast:
            return animationDuration/15
        }
    }
    
    var delegate: AlgorithmDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentMode = .redraw
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.contentMode = .redraw
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
        self.layer.sublayers?.removeAll()
        self.itemLayers.removeAll()
        
        let itemWidth = rect.width / CGFloat(items.count)
        
        for (i, item) in items.enumerated() {
            let rect = CGRect(x: 0, y: 0, width: itemWidth, height: -rect.height * CGFloat(item.value))
            let path = UIBezierPath(rect: rect)
            
            let layer = CAShapeLayer()
            layer.fillColor = item.color.cgColor
            layer.lineWidth = 0
            layer.strokeColor = item.color.cgColor
            layer.path = path.cgPath
            layer.position = CGPoint(x: CGFloat(i) * itemWidth, y: frame.maxY)
            itemLayers.append(layer)
            
            self.layer.addSublayer(layer)
        }
    }
    
    
    func animateSorting() {
        isAnimating = true
        
        //Start sorting from the first sorting step
        dataSource?.sortItems()
        invalidateAnimation()
        animate()
        let _ = Timer.init(timeInterval: 0.03, repeats: false) { [weak self] _ in
            self?.animate()
        }
    }
    
    func stopAnimation() {
        isAnimating = false
    }
    
    func invalidateAnimation() {
        itemLayers.forEach { $0.removeAllAnimations() }
    }
    
    func shuffle() {
        isAnimating = true
        invalidateAnimation()
        dataSource?.shuffleItems()
        animate()
        let _ = Timer.init(timeInterval: animationDelay, repeats: false) { [weak self] _ in
            self?.animate()
        }
    }
    
    private func animate() {
        guard isAnimating, let step = dataSource?.nextStep else { return }
        currentAnimation = getAnimation(forStep: step)
        currentAnimation?.run(withDuration: animationDuration, completion: { [weak self] finished in
            if finished {self?.animate()}
        })
    }
    
    private func getAnimation(forStep step: SortingStep) -> Animatable? {
        switch step.type {
        case .highlight:
            return HighlightAnimation(layer: itemLayers[step.highlightPosition!])
        case .swap:
            //Create animation and update itemLayers and dataSource after the animation is created so that it doesn't interfere with the animation
            let (i, j) = step.swapPosition!
            let animation = AlgorithmAnimation(layer1: itemLayers[i], layer2: itemLayers[j])
            self.itemLayers.swapAt(i, j)
            return animation
        }
    }
    
}
