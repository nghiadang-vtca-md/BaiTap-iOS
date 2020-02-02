//
//  AnimationManager.swift
//  Animator_Starter
//
//  Created by mac247 on 2/1/20.
//  Copyright © 2020 Paradigm Shift Development, LLC. All rights reserved.
//

import UIKit

class AnimationManager {
    // Calculated screen bounds
    class var screenBounds: CGRect {
        return UIScreen.main.bounds
    }
    
    // Screen positions
    class var screenRight: CGPoint {
        return CGPoint(x: screenBounds.maxX, y: screenBounds.midY)
    }
    
    class var screenLeft: CGPoint {
        return CGPoint(x: screenBounds.minX, y: screenBounds.midY)
    }
    
    class var screenTop: CGPoint {
        return CGPoint(x: screenBounds.midX, y: screenBounds.minY)
    }
    
    class var screenBottom: CGPoint {
        return CGPoint(x: screenBounds.midX, y: screenBounds.maxY)
    }
    
    // tracking variables
    var constraintOrigins = [CGFloat]()
    var currentConstraints: [NSLayoutConstraint]!
    
    init(activeConstraints: [NSLayoutConstraint]) {
        for constraint in activeConstraints {
            constraintOrigins.append(constraint.constant)
            constraint.constant -= AnimationManager.screenBounds.width
        }
        
        currentConstraints = activeConstraints
    }
}
