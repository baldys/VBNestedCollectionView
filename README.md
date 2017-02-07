# VBNestedCollectionView

![alt text](https://github.com/baldys/VBNestedCollectionView/blob/master/Preview.gif "Logo Title Text 1")

UICollectionViews nested inside UITableViewCells that allows you to side scroll items in both dimensions to present an iTunes or Netflix-like UI 

# Getting started

1. Add the pod
  ```
  pod 'VBNestedCollectionView'
  ```
  
2. Subclass VBNestedCollectionView. (or if you want no custom functionality, use VBNestedCollectionView directly)

  ```
  protocol VBNestedCollectionViewDataSource: class {
      var rowHeight: CGFloat { get set }

      func numberOfRows() -> Int
      func numberOfItemsAt(row: Int) -> Int

      func cellFor(collectionView: UICollectionView, row: Int, item: Int, indexPath: IndexPath) -> UICollectionViewCell
      func customizeCollectionView(collectionView: UICollectionView)
  }
  ```

3. Add as a subview

  ```
  myNestedView = CatPhotosNestedCollectionView(frame: self.view.frame);
  view.addSubview(myNestedView)
  myNestedView.tapHandler = self;
  ```

4. Implement delegates to provide the items in the view and to handle didSelect events in your ViewController
