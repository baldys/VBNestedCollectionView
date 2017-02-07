//
//  CatBreeds.swift
//  VBCollectionView
//
//  Created by Veronica Baldys on 2/1/17.
//  Copyright © 2017 Veronica Baldys. All rights reserved.
//

import UIKit

struct CatData {
    
    var breed:String = ""
    var imageName:String = ""
    var catImage:UIImage
    var title:String = ""
    
    init(_ imageName:String, _ breed:String) {
        self.imageName = imageName
        self.breed = breed
        self.catImage = UIImage.init(imageLiteralResourceName: imageName)
    }
    
    init(_ imageName:String) {
        self = CatData(imageName, "")
    }
    
    init(_ imageName:String, title:String) {
        self.title = title
        self = CatData(imageName)
    }
}

struct CatBreed {
    
    var breed:String
    var cats = [CatData]()
    
    init(_ breed:String, cats:[CatData]) {
        self.breed = breed
        self.cats = cats
        
    }
    
}
