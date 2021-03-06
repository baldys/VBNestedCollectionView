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
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: .from)!
        let toVC = transitionContext.viewController(forKey: .to)!
        let container = transitionContext.containerView
        
        let endFrame = UIScreen.main.bounds
        let startFrame = sourceFrame!
        
        toVC.view.frame = startFrame
        sourceImageView?.frame = startFrame
        sourceImageView?.contentMode = .scaleAspectFill
        sourceImageView?.clipsToBounds = true
        
        
        container.addSubview(sourceImageView!)

        if presenting! {
            container.addSubview(toVC.view)
            toVC.view.isHidden = true

            
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                self.sourceImageView?.frame = endFrame

                toVC.view.frame = endFrame
            }) { (Bool) -> Void in
                self.sourceImageView?.removeFromSuperview()
                transitionContext.completeTransition(true)
                fromVC.endAppearanceTransition()
                toVC.view.isHidden = false
            }

            
        }
        else {
            container.addSubview(fromVC.view)
            fromVC.view.isHidden = true
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: { () -> Void in
                self.sourceImageView?.frame = endFrame
                toVC.view.frame = endFrame
                
            }) { (Bool) -> Void in
                self.sourceImageView?.removeFromSuperview()
                
                transitionContext.completeTransition(true)
                toVC.endAppearanceTransition()
                fromVC.view.isHidden = false
            }
        }
    }
}
