//
//  CatDetailViewController.swift
//  VBNestedCollectionViewDemo
//
//  Created by Veronica Baldys on 2/4/17.
//  Copyright © 2017 VeronicaBaldys.com All rights reserved.
//

import UIKit


class CatDetailViewController: UIViewController {

    var catImage:UIImage?
    
    @IBOutlet weak var catImageView: UIImageView!
    
    @IBAction func closeAction(_ sender: UIButton) {        
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        catImageView.image = catImage
    }
}

