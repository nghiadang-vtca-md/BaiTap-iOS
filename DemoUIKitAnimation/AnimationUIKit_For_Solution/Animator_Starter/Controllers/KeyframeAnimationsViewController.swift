//
//  KeyframeAnimationsViewController.swift
//  Animator_Starter
//
//  Created by Harrison Ferrone on 18.02.18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import UIKit

class KeyframeAnimationsViewController: UIViewController {

    // MARK: Storyboard outlets
    @IBOutlet weak var animationTarget: UIButton!
    
    var targetOffset: CGFloat {
        return animationTarget.frame.width/2
    }
    
    // MARK: Appearance
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: UI Setup
        animationTarget.round(cornerRadius: animationTarget.frame.size.width/2, borderWidth: 3.0, borderColor: .black)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // TODO: Fire keyframe animation
        bounceImageWithKeyFrame()
        
        self.segueToNextViewController(segueID: Constants.Segues.toConstraintsVC, delay: 5.0)
    }

    // MARK: Keyframe animation
    
    func bounceImageWithKeyFrame() {
        UIView.animateKeyframes(withDuration: 2.5, delay: 0, options: [.repeat, .calculationModeCubic], animations: {
            
            // Right
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25) {
                self.animationTarget.center = AnimationManager.screenRight
                self.animationTarget.center.x -= self.targetOffset
            }
            
            // Top
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.25) {
                self.animationTarget.center = AnimationManager.screenTop
                self.animationTarget.center.y += self.targetOffset
            }
            
            // Left
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.25) {
                self.animationTarget.center = AnimationManager.screenLeft
                self.animationTarget.center.x += self.targetOffset
            }
            
            // Bottom
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.25) {
                self.animationTarget.center = AnimationManager.screenBottom
                self.animationTarget.center.y -= self.targetOffset
            }
            
            
            // Top
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.5) {
                self.animationTarget.center = AnimationManager.screenTop
                self.animationTarget.center.y += self.targetOffset
            }
            
            // Bottom
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.5) {
                self.animationTarget.center = AnimationManager.screenBottom
                self.animationTarget.center.y -= self.targetOffset
            }
            
            // Left
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.25) {
                self.animationTarget.center = AnimationManager.screenLeft
                self.animationTarget.center.x += self.targetOffset
            }
            
            // Bottom
            UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.25) {
                self.animationTarget.center = AnimationManager.screenBottom
                self.animationTarget.center.y -= self.targetOffset
            }
            
        }, completion: nil)
    }
}
