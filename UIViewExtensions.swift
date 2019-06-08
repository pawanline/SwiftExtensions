//
//  UIViewExtensions.swift
//  SwiftExtensionProject
//
//  Created by Pawan Kumar on 09/06/19.
//  Copyright © 2019 PawanShivHari inc. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func removeGredient() {
        if let layers = self.layer.sublayers {
            for layer in layers {
                if (layer.name ?? "") == "gradientLayer" {
                    layer.removeFromSuperlayer()
                    break
                }
            }
        }
    }
    
    // function to add gradient based on angle
    // angle 0 for Horizontal and 90 for vertical
    
    func addGredient(angle: Float = 0, cornerRadius: CGFloat = 0.0, colors: [UIColor] = [.red, .yellow]) {
        self.removeGredient()
        let gradientLayer = CAGradientLayer()
        gradientLayer.name = "gradientLayer"
        gradientLayer.frame = self.bounds
        var cgColors = colors.map { (clr) -> CGColor in
            clr.cgColor
        }
        
        let alpha: Float = angle / 360
        let startPointX = powf(
            sinf(2 * Float.pi * ((alpha + 0.75) / 2)),
            2
        )
        let startPointY = powf(
            sinf(2 * Float.pi * ((alpha + 0) / 2)),
            2
        )
        let endPointX = powf(
            sinf(2 * Float.pi * ((alpha + 0.25) / 2)),
            2
        )
        let endPointY = powf(
            sinf(2 * Float.pi * ((alpha + 0.5) / 2)),
            2
        )
        
        if angle == 90 {
            cgColors.reverse()
        }
        
        gradientLayer.startPoint = CGPoint(x: CGFloat(startPointX), y: CGFloat(startPointY))
        gradientLayer.endPoint = CGPoint(x: CGFloat(endPointX), y: CGFloat(endPointY))
        

        gradientLayer.cornerRadius = cornerRadius
        gradientLayer.masksToBounds = true
        
        gradientLayer.colors = cgColors
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}