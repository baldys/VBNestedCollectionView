//
//  ViewController.swift
//  VBNestedCollectionViewDemo
//
//  Created by Veronica Baldys on 2/2/17.
//  Copyright © 2017 VeronicaBaldys.com All rights reserved.
//

import UIKit

class CatPhotosViewController: UIViewController {

    var myNestedView: CatPhotosCollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        myNestedView = CatPhotosCollectionView(frame: self.view.frame)
        view.addSubview(myNestedView)
        myNestedView.delegate = self
    }
}

extension CatPhotosViewController: CellSelectionDelegate {
    
    func didSelectCell(_ cell: CatPhotosCollectionViewCell, from collectionView: UICollectionView, at indexPath: IndexPath) {
    
        let detailVC = CatDetailViewController(nibName:"CatDetailViewController", bundle:nil)
        
        let realRect = collectionView.convert(cell.frame, to: self.view)
        let cellImage = cell.imageView.image
        detailVC.catImage = cellImage
        
        let animator = Animator()
        animator.sourceImageView = UIImageView(image: cell.imageView.image)
        animator.sourceFrame = realRect
        animator.presenting = true
        detailVC.modalPresentationStyle = .custom
        detailVC.transitioningDelegate = animator
        
        present(detailVC, animated: true)

    }

}


