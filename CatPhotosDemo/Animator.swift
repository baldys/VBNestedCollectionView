//
//  Animator.swift
//  VBNestedCollectionView
//
//  Created by Veronica Baldys on 2/6/17.
//  Copyright © 2017 VeronicaBaldys.com. All rights reserved.
//

import UIKit

class Animator: NSObject, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    var initFrame: CGRect?
    var imageView: UIImageView?
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: .from)!
        let toVC = transitionContext.viewController(forKey: .to)!
        
        transitionContext.containerView.addSubview(fromVC.view);
        transitionContext.containerView.addSubview(toVC.view);
        
        let endFrame = UIScreen.main.bounds
        let startFrame = initFrame!;
        
        toVC.view.frame = startFrame;
        
        UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
            toVC.view.frame = endFrame
        }) { (bool:Bool) in
            transitionContext.completeTransition(true);
        }
    }
}
