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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension CatPhotosViewController: CellSelectionDelegate {
    
    func didSelectCell(_ cell: CatPhotosCollectionViewCell, from collectionView: UICollectionView, at indexPath: IndexPath) {
    
        let detailVC = CatDetailViewController(nibName:"CatDetailViewController", bundle:nil)
        
        let animator = Animator()
        
        let realRect = collectionView.convert(cell.frame, to: self.view)
        
        let cellImage = cell.imageView.image
        
//        detailVC.catImageView.image = cell.imageView.image
        
        let collectionRowIndex = collectionView.tag
        detailVC.catData = DataController().items[collectionRowIndex].cats[indexPath.row]

        animator.sourceFrame = realRect
        animator.presenting = true
        detailVC.modalPresentationStyle = .custom
        detailVC.transitioningDelegate = animator
        detailVC.delegate = self
        present(detailVC, animated: true)

    }

}

extension CatPhotosViewController: DetailViewControllerDelegate {
    
    func closeViewController(_ viewController: UIViewController) {
        let animator = Animator()
    
        animator.presenting = false
        
        self.transitioningDelegate = animator
        self.modalPresentationStyle = .custom
        
        
    }
}

