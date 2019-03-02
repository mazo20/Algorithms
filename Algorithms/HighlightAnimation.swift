//
//  HighlightAnimation.swift
//  Algorithms
//
//  Created by Maciej Kowalski on 21/02/2019.
//  Copyright © 2019 Maciej Kowalski. All rights reserved.
//

import UIKit

class HighlightAnimation: NSObject, CAAnimationDelegate, Animatable {
    private var animation = CABasicAnimation()
    private var completion: ((Bool) -> Void)?
    private var layer: CAShapeLayer
    
    init(layer: CAShapeLayer) {
        self.layer = layer
        super.init()

        animation = createAnimation(from: nil, to: nil)
    }
    
    func run(withDuration duration: CFTimeInterval, completion: ((Bool) -> Void)?) {
        animation.duration = duration
        layer.add(animation, forKey: "higlightAnimation")
        self.completion = completion
    }
    
    func createAnimation(from: Any?, to: Any?) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: #keyPath(CAShapeLayer.fillColor))
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        animation.fromValue = layer.backgroundColor
        animation.toValue = UIColor.black.cgColor
        animation.delegate = self
        return animation
    }
    
    func invalidate() {
        layer.removeAllAnimations()
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        guard let completion = completion else { return }
        completion(flag)
    }
    
    
}
