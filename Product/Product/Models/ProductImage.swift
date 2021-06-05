//  Created on 6/5/21.

import Foundation
import UIKit

struct ProductImage {
    
    let imageUrl: String
    
}

// MARK: - Collection View Compatible

extension ProductImage: CollectionViewCompatible {
    
    var reuseIdentifier: String {
        return ProductImageCell.reuseIdentifier
    }
    
    func cellForCollectionView(collectionView: UICollectionView,
                               atIndexPath indexPath: IndexPath, actionButtons: [UIButton]?) -> UICollectionViewCell {
        guard let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? ProductImageCell) else {

            return UICollectionViewCell()
        }
        
        cell.configureWithModel(model: self, indexPath: indexPath)
        return cell
    }

}
