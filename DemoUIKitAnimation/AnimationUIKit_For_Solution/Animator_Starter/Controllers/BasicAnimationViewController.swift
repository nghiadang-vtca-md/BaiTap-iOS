//
//  ViewController.swift
//  Animator_Starter
//
//  Created by Harrison Ferrone on 18.02.18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import UIKit

class BasicAnimationViewController: UIViewController {
    
    // MARK: Storyboard outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var graphic: UIImageView!
    @IBOutlet weak var loadingLabel: UILabel!
    
    // MARK: Appearance
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("1")
        // UI setup
        //graphic.round(cornerRadius: graphic.frame.size.width/2, borderWidth: 3.0, borderColor: .black)
        graphic.round(cornerRadius: graphic.frame.size.width/2, borderWidth: 3.0, borderColor: .black)
        
        
        // TODO: Animation setup
        titleLabel.alpha = 0
        graphic.alpha = 0
        loadingLabel.alpha = 0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("2")
        // TODO: Fire initial animations
        animateTitleLabelIn()
        animateGraphicIn()
    }
    
    // MARK: Animations
    func animateTitleLabelIn() {
        UIView.animate(withDuration: 1.5) {
            self.titleLabel.alpha = 1
            self.titleLabel.frame.origin.y -= 50
        }
    }
    
    func animateGraphicIn() {
        // options: [] : options: [.curveEaseInOut]
        UIView.animate(withDuration: 1.5, delay: 0.75, options: [.curveEaseInOut], animations: {
            self.graphic.alpha = 1
            self.graphic.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }, completion: { (completed) in
            self.animateLoadingLabelPulse()
            self.segueToNextViewController(segueID: Constants.Segues.toSpringsVC, delay: 3.0)
        })
    }
    
    func animateLoadingLabelPulse()  {
        
        UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat, .autoreverse], animations: {
            self.loadingLabel.alpha = 1
            self.loadingLabel.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }, completion: nil)
    }
}

