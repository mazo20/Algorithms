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
    
    private var animation = CABasicAnimation()
    private var completion: ((Bool) -> Void)?
    private var layer: CALayer
    
    init(layer: CALayer, from: Any, to: Any) {
        self.layer = layer
        super.init()
        animation = createAnimation(from: from, to: to)
    }
    
    internal func createAnimation(from: Any?, to: Any?) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.position))
        animation.fromValue = from
        animation.toValue = to
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.delegate = self
        return animation
    }
    
    func run(withDuration duration: CFTimeInterval, completion: ((Bool) -> Void)?) {
        animation.duration = duration
        layer.add(animation, forKey: #keyPath(CALayer.position))
        
        self.completion = completion
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        guard let completion = completion else {
            return
        }
        if flag {
            completion(true)
        }
    }
    
}


