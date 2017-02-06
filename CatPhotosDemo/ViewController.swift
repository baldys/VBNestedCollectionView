//
//  ViewController.swift
//  VBNestedCollectionViewDemo
//
//  Created by Veronica Baldys on 2/2/17.
//  Copyright © 2017 VeronicaBaldys.com All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myNestedView: CatPhotosCollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        myNestedView = CatPhotosCollectionView(frame: self.view.frame);
        view.addSubview(myNestedView)
        myNestedView.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: CellSelectionDelegate{
    func didSelectCell(from collectionView: UICollectionView, at indexPath: IndexPath) {
    
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


