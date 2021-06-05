//  Created on 6/5/21.

import Foundation
import UIKit

protocol CollectionViewCellProtocol {
    
    associatedtype TYPE
    var model: TYPE? { get set }
    var indexPath: IndexPath? { get set }
    func configureWithModel(model: TYPE, indexPath: IndexPath)
}

protocol CollectionViewCompatible {
    
    var reuseIdentifier: String { get }
    
    func cellForCollectionView(collectionView: UICollectionView, atIndexPath indexPath: IndexPath, actionButtons: [UIButton]?) -> UICollectionViewCell
    
}

class CollectionView: UICollectionView {
    
    var data: [CollectionViewCompatible]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

class CollectionDataSet {
    
    var data: [CollectionViewCompatible]
    
    public init(data: [CollectionViewCompatible]) {
        self.data = data
    }
}

extension CollectionView: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let unwrapData = data {
            let model = unwrapData[indexPath.row]
            return model.cellForCollectionView(collectionView: collectionView, atIndexPath: indexPath, actionButtons: nil)
        }
        return UICollectionViewCell()
    }

}
