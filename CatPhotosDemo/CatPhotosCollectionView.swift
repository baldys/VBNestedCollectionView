//
//  CatPhotosDemo.swift
//  VBNestedCollectionViewDemo
//
//  Created by Veronica Baldys on 2/3/17.
//

import Foundation
import UIKit


protocol CellSelectionDelegate {
    func didSelectCell(_ cell:CatPhotosCollectionViewCell, from collectionView: UICollectionView, at indexPath: IndexPath)
}

class CatPhotosCollectionView: VBNestedCollectionView, VBNestedCollectionViewDataSource {
 
    var rowHeight: CGFloat
    
    var dataController: DataController
    
    var delegate: CellSelectionDelegate?

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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CatPhotosCollectionViewCell
        
        cell.imageView.image = dataController.items[row].cats[indexPath.item].catImage
        cell.title.text = dataController.items[row].cats[indexPath.row].imageName

        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! CatPhotosCollectionViewCell
        delegate?.didSelectCell(cell, from: collectionView, at: indexPath)
        
    }

}

