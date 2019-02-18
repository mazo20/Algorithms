//
//  AlgorithmAnimation.swift
//  Algorithms
//
//  Created by Maciej Kowalski on 17/02/2019.
//  Copyright © 2019 Maciej Kowalski. All rights reserved.
//

import UIKit

protocol Animatable {
    func run(withDuration duration: CFTimeInterval, completion: ((Bool) -> Void)?)
    func createAnimation(from: Any?, to: Any?) -> CABasicAnimation
}

class AlgorithmAnimation: NSObject, CAAnimationDelegate, Animatable {
    
    private var animation1 = CABasicAnimation()
    private var animation2 = CABasicAnimation()
    private var completion: ((Bool) -> Void)?
    private var layer1: CALayer
    private var layer2: CALayer
    private var numberOfCompletions = 0
    
    init(layer1: CALayer, layer2: CALayer) {
        self.layer1 = layer1
        self.layer2 = layer2
        
        super.init()
        animation1 = createAnimation(from: layer1.position, to: layer2.position)
        animation2 = createAnimation(from: layer2.position, to: layer1.position)
    }
    
    internal func createAnimation(from: Any?, to: Any?) -> CABasicAnimation {
        //Do not change animation from and to value here, layer's position is not updated here (always has starting position)
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.position))
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.delegate = self
        return animation
    }
    
    func run(withDuration duration: CFTimeInterval, completion: ((Bool) -> Void)?) {
        //Change animation from and to value here because that's the moment that the positions are correct,
        animation1.fromValue = layer1.position
        animation1.toValue = layer2.position
        animation2.fromValue = layer2.position
        animation2.toValue = layer1.position
        animation1.duration = duration
        animation2.duration = duration
        swap(&layer1.position, &layer2.position)
        
        layer1.add(animation1, forKey: #keyPath(CALayer.position))
        layer2.add(animation2, forKey: #keyPath(CALayer.position))
        
        
        self.completion = completion
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        numberOfCompletions += 1
        guard let completion = completion else {
            return
        }
        if numberOfCompletions == 2 {
            completion(true)
            
        }
    }
    
}


