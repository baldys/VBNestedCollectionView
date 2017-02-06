//
//  CatPhotosDemo.swift
//  VBNestedCollectionViewDemo
//
//  Created by Veronica Baldys on 2/3/17.
//

import Foundation
import UIKit


protocol CatPhotosTapHandler {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
}

class CatPhotosCollectionView: VBNestedCollectionView, VBNestedCollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Row: \(getRowFromCollectionView(collectionView: collectionView)!), Item: \(indexPath.item)")
        if(tapHandler != nil) {
            tapHandler?.collectionView(collectionView, didSelectItemAt: indexPath)
        }
    }

    var rowHeight: CGFloat
    
    var dataController: DataController
    
    var tapHandler: CatPhotosTapHandler?

    override init(frame: CGRect) {
        rowHeight = 200
        dataController = DataController()
        super.init(frame: frame)
        self.dataSource = self
        
        self.layout = UICollectionViewFlowLayout();
        self.layout!.scrollDirection = .horizontal
        self.layout!.itemSize = CGSize(width: 198.0, height:198.0)
        self.layout!.minimumInteritemSpacing = 0.0
        self.layout!.minimumLineSpacing = 2.0

        self.backgroundColor = UIColor.black
    }

    required init?(coder aDecoder: NSCoder) {
        rowHeight = 200
        dataController = DataController()
        super.init(coder: aDecoder)
        self.dataSource = self
    }

    func customizeCollectionView(collectionView: UICollectionView) {
        collectionView.register(UINib.init(nibName: "CatPhotosCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier:"Cell")
        collectionView.backgroundColor = UIColor.white
    }

    func numberOfRows() -> Int {
        return dataController.items.count
    }

    func numberOfItemsAt(row: Int) -> Int {
        return dataController.items[row].cats.count
    }

    func cellFor(collectionView: UICollectionView, row: Int, item: Int, indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CatPhotosCollectionViewCell
        
        cell.imageView.image = dataController.items[row].cats[indexPath.item].catImage
        cell.title.text = dataController.items[row].cats[indexPath.row].imageName

        return cell
    }
}
