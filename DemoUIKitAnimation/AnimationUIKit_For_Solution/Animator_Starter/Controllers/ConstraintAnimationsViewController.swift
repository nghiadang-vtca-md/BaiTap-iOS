//
//  ConstraintAnimationsViewController.swift
//  Animator_Starter
//
//  Created by Harrison Ferrone on 18.02.18.
//  Copyright © 2018 Paradigm Shift Development, LLC. All rights reserved.
//

import UIKit

class ConstraintAnimationsViewController: UIViewController {
    
    // MARK: Storyboard outlets
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var newsletterView: UIView!
    @IBOutlet weak var welcomeCenterX: NSLayoutConstraint!
    @IBOutlet weak var newsletterCenterX: NSLayoutConstraint!
    
    // MARK: Additional variables
    var newsletterInfoLabel = UILabel()
    var animationManager: AnimationManager!
    
    // MARK: Appearance
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Programmatic views
        newsletterInfoLabel.backgroundColor = .clear
        newsletterInfoLabel.text = "Help us make your animation code that much better by subscribing to our weekly newsletter! \n\n It's free and you can unsubscribe any time without hurting our feelings...much."
        newsletterInfoLabel.font = UIFont(name: "Bodoni 72 Oldstyle", size: 15)
        newsletterInfoLabel.textColor = .darkGray
        newsletterInfoLabel.textAlignment = .center
        newsletterInfoLabel.alpha = 0
        newsletterInfoLabel.backgroundColor = .black
        newsletterInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        newsletterInfoLabel.numberOfLines = 0
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // TODO: Offscreen positioning
        
//        welcomeCenterX.constant -= AnimationManager.screenBounds.width
//        newsletterCenterX.constant -= AnimationManager.screenBounds.width
        
        animationManager = AnimationManager(activeConstraints: [welcomeCenterX, newsletterCenterX])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // TODO: Fire initial animations
        animateViewsOnScreen()
    }
    
    // MARK: Actions
    
    @IBAction func buttonMoreInfo_Clicked(_ sender: UIButton) {
        animateNewsletterHeight()
        animateWelcomeLabel()
    }
    
    // MARK: Animations
    // method 1:
//    func animateViewsOnScreen() {
//        UIView.animate(withDuration: 1.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [.curveEaseInOut], animations: {
//
//            self.welcomeCenterX.constant += AnimationManager.screenBounds.width
//            self.newsletterCenterX.constant += AnimationManager.screenBounds.width
//            self.view.layoutIfNeeded()
//
//        }, completion: nil)
//    }
    
    // method 2: using init to tracking
    func animateViewsOnScreen() {
        UIView.animate(withDuration: 1.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [.curveEaseInOut], animations: {
            
            self.welcomeCenterX.constant = self.animationManager.constraintOrigins[0]
            self.newsletterCenterX.constant = self.animationManager.constraintOrigins[1]
            self.view.layoutIfNeeded()
            
        }, completion: nil)
    }
    
    func animateNewsletterHeight() {
        if let heightConstraint = newsletterView.returnConstrain(withID: "NewsletterHeight") {
            print(heightConstraint.description)
            heightConstraint.constant = 350
            print(heightConstraint.description)
        } else {
            print("No constraint found for that ID ...")
        }
        
        UIView.animate(withDuration: 1.75, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: [], animations: {
            self.view.layoutIfNeeded()
        }) { completed in
            self.addDynamicInfoLabel()
        }
    }
    
    func animateWelcomeLabel() {
        let modifiedWelcomeLabel = NSLayoutConstraint(item: welcomeLabel, attribute: .top, relatedBy: .equal, toItem: welcomeLabel.superview, attribute: .top, multiplier: 1.0, constant: 100)
        
        if let welcomeTop = view.returnConstrain(withID: "WelcomeLabelTop") {
            print(welcomeTop.description)
            welcomeTop.isActive = false
            modifiedWelcomeLabel.isActive = true
        }
        
        UIView.animate(withDuration: 0.75) {
            self.view.layoutIfNeeded()
        }
    }
    
    func addDynamicInfoLabel() {
        newsletterView.addSubview(newsletterInfoLabel)
        // Cách 1 (tự chế): animate từ góc trên bên trái xuống
        // nhớ sửa lại alpha là 1; backgroundColor là .black
        // ở viewDidLoad
        //        newsletterInfoLabel.alpha = 1
        //        newsletterInfoLabel.backgroundColor = .black
//        let xAnchor = newsletterInfoLabel.centerXAnchor.constraint(equalTo: newsletterView.centerXAnchor)
//        let yAnchor = newsletterInfoLabel.centerYAnchor.constraint(equalTo: newsletterView.centerYAnchor)
//        let widthAnchor = newsletterInfoLabel.widthAnchor.constraint(equalTo: newsletterView.widthAnchor, multiplier: 0.75)
//        let heightAnchor = newsletterInfoLabel.heightAnchor.constraint(equalTo: newsletterInfoLabel.widthAnchor)
//
//        NSLayoutConstraint.activate([xAnchor,yAnchor,widthAnchor,heightAnchor])
//
//        UIView.animate(withDuration: 1.75, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: [.curveEaseInOut], animations: {
//            self.view.layoutIfNeeded()
//        }, completion: nil)
         // end Cách 1
        
        
        // Cách 2: giống tutorial từ trái sang phải
        // nhớ sửa lại alpha là 0; backgroundColor là .clear
        // ở viewDidLoad
        //newsletterInfoLabel.alpha = 0
        //newsletterInfoLabel.backgroundColor = .clear
       
        let xAnchor = newsletterInfoLabel.centerXAnchor.constraint(equalTo: newsletterView.leftAnchor, constant: -75)
        let yAnchor = newsletterInfoLabel.centerYAnchor.constraint(equalTo: newsletterView.centerYAnchor)
        let widthAnchor = newsletterInfoLabel.widthAnchor.constraint(equalTo: newsletterView.widthAnchor, multiplier: 0.75)
        let heightAnchor = newsletterInfoLabel.heightAnchor.constraint(equalTo: newsletterInfoLabel.widthAnchor)
        NSLayoutConstraint.activate([xAnchor,yAnchor,widthAnchor,heightAnchor])
        self.view.layoutIfNeeded()
        
        UIView.animate(withDuration: 1.0) {
            xAnchor.constant = self.newsletterView.frame.size.width/2
            self.newsletterInfoLabel.alpha = 1
            self.newsletterInfoLabel.backgroundColor = .clear
            self.view.layoutIfNeeded()
        }
    }

}

extension UIView {
    func returnConstrain(withID: String) -> NSLayoutConstraint? {
        var constraintSearch: NSLayoutConstraint?
        
        for constraint in self.constraints {
            if constraint.identifier == withID {
                constraintSearch = constraint
            }
        }
        return constraintSearch
    }
}
