//
//  Animator.swift
//  VBNestedCollectionView
//
//  Created by Veronica Baldys on 2/6/17.
//  Copyright © 2017 VeronicaBaldys.com. All rights reserved.
//

import UIKit

class Animator: NSObject, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    var sourceFrame: CGRect?
    var targetFrame: CGRect?
    var sourceImageView: UIImageView?
    var presenting:Bool?
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return self
    }
    
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {

        return self
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: .from)!
        let toVC = transitionContext.viewController(forKey: .to)!
        
        
        let endFrame = UIScreen.main.bounds
        let startFrame = sourceFrame!
        
        toVC.view.frame = startFrame
        
        if presenting! {
            transitionContext.containerView.addSubview(toVC.view)
            
            UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
//                toVC.view.transform = CGAffineTransform(scaleX: 1.02, y: 1.02)
                toVC.view.frame = endFrame
            }) { (bool:Bool) in
                transitionContext.completeTransition(true)
                fromVC.endAppearanceTransition()
            }

            
        }
        else {
            transitionContext.completeTransition(true)
            fromVC.endAppearanceTransition()

        }

    }
}
