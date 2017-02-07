import Foundation
import UIKit

// Implement this protocol from your View Controller
protocol VBNestedCollectionViewDataSource: class {
    
    // Total number of rows in the
    func numberOfRows() -> Int

    // Items that scroll horizontally
    func numberOfItemsAt(row: Int) -> Int
    
    // Return the cell for a specific row:item index
    func cellFor(collectionView: UICollectionView, row: Int, item: Int, indexPath: IndexPath) -> UICollectionViewCell
    
    // Vertical size of each row
    var rowHeight: CGFloat { get set }
    
    // Customize the CollectionViews that are created for each row
    // For example: register your cell classes or set up custom layout
    func customizeCollectionView(collectionView: UICollectionView)
}

class VBNestedCollectionView: UIView, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    weak var _dataSource: VBNestedCollectionViewDataSource!
    var dataSource: VBNestedCollectionViewDataSource!{
        get {return self._dataSource}
        set(dataSource) {
            if (self._dataSource == nil) {
                setup(dataSource: dataSource)
                self._dataSource = dataSource
            }
        }
    }

    var tableView: UITableView!

    func setup(dataSource: VBNestedCollectionViewDataSource) {
        tableView = UITableView(frame: frame, style: .plain)

        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = CGFloat(dataSource.rowHeight)
        tableView.separatorStyle = .none
        addSubview(tableView)
    }

    var layout: UICollectionViewFlowLayout?

    override init(frame: CGRect) {
        super.init(frame:frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return _dataSource.numberOfItemsAt(row: collectionView.superview!.superview!.tag)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(collectionView.superview!.superview!.tag)
        return _dataSource.cellFor(collectionView: collectionView, row: collectionView.superview!.superview!.tag, item: indexPath.item, indexPath: indexPath)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _dataSource.numberOfRows()
    }

    func getRowFromCollectionView(collectionView: UICollectionView) -> Int?{
        return collectionView.superview!.superview!.tag
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "VBNestedTableViewCell") {
            cell.tag = indexPath.item
            return cell
        } else {
            let cell = UITableViewCell(style: .default, reuseIdentifier: "VBNestedTableViewCell")
            cell.tag = indexPath.item
            
            print(indexPath.row)

            if(layout == nil) { // Create a default layout if one was not provided
                layout = UICollectionViewFlowLayout()
                layout!.scrollDirection = .horizontal
            }

            let collectionView = UICollectionView(frame: CGRect(x: 0.0, y: 0.0, width: self.bounds.width, height: _dataSource.rowHeight), collectionViewLayout: layout!)
            collectionView.dataSource = self
            collectionView.delegate = self
            
            dataSource.customizeCollectionView(collectionView:collectionView);
            
            cell.contentView.addSubview(collectionView)
            return cell
        }
    }
}






















