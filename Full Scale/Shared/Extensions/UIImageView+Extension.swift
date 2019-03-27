//
//  UIImageView+Extension.swift
//  Full Scale
//
//  Created by Randolf Dini-ay on 18/03/2019.
//  Copyright © 2019 Randolf Dini-ay. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func orientationTop() {
        UIView.animate(withDuration:0.25, animations: {
            self.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi * -3))
        })
    }
    
    func orientationDown() {
        UIView.animate(withDuration:0.25, animations: {
            self.transform = CGAffineTransform(rotationAngle: 0)
        })
    }
    
    func startRotatingRight() {
        startRotate(value: Double.pi * 1.5)
    }
    
    func startRotatingLeft() {
        startRotate(value: Double.pi * -1.5)
    }
    
    func stopRotating() {
        self.layer.removeAnimation(forKey: "rotationAnimation")
    }
    
    fileprivate func startRotate(value: Double) {
        
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.fromValue = 0
        rotation.toValue = NSNumber(value: value)
        rotation.duration = 1.5
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
    
}

