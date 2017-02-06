//
//  CatDetailViewController.swift
//  VBNestedCollectionViewDemo
//
//  Created by Veronica Baldys on 2/4/17.
//  Copyright © 2017 VeronicaBaldys.com All rights reserved.
//

import UIKit

protocol DetailViewControllerDelegate: class {
    
    func closeViewController(_ viewController:UIViewController)
    
}
class CatDetailViewController: UIViewController {

    weak var delegate:DetailViewControllerDelegate?
    var catImage:UIImage?
    
    @IBOutlet weak var catImageView: UIImageView!
    
    @IBAction func closeAction(_ sender: UIButton) {
        
        
        
        let animator = Animator()
        animator.sourceFrame = view.bounds
        animator.sourceImageView = self.catImageView
        animator.presenting = false
        
        dismiss(animated: true, completion: nil)

        delegate?.closeViewController(self)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.catImageView.image = catImage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        catImageView.image = catImage

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

