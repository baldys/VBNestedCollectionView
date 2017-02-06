//
//  ViewController.swift
//  VBNestedCollectionViewDemo
//
//  Created by Veronica Baldys on 2/2/17.
//  Copyright © 2017 VeronicaBaldys.com All rights reserved.
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

class ViewController: UIViewController {

    var myNestedView: CatPhotosCollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myNestedView = CatPhotosCollectionView(frame: self.view.frame);
        view.addSubview(myNestedView)
        myNestedView.tapHandler = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: CatPhotosTapHandler{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailVC = CatDetailViewController()
        let animator = Animator()
        
        let cell = collectionView.cellForItem(at: indexPath)!
        let realRect = collectionView.convert(cell.frame, to: self.view)
        
        animator.initFrame = realRect
        detailVC.modalPresentationStyle = .custom
        detailVC.transitioningDelegate = animator
        
        self.present(detailVC, animated: true)
    }
    
}


