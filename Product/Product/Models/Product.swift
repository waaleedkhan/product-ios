//  Created on 6/4/21.

import Foundation
import UIKit

struct Product: Codable {
    
    // MARK: - Members
    
    var createdAt: Date?
    var price: String?
    var name: String?
    var uid: String?
    var imageIds: [String]?
    var imageUrls: [String]?
    var imageUrlsThumbnails: [String]?
    
    // Coding Keys
    
    enum CodingKeys: String, CodingKey {
        
        case createdAt = "created_at"
        case price
        case name
        case uid
        case imageIds = "image_ids"
        case imageUrls = "image_urls"
        case imageUrlsThumbnails = "image_urls_thumbnails"
        
    }

}

// MARK: - TableView Compatible Implementation

extension Product: TableViewCompatible {
    
    var reuseIdentifier: String {
        return ProductCell.reuseIdentifier
    }
    
    func cellForTableView(tableView: UITableView,
                          atIndexPath indexPath: IndexPath,
                          actionButtons: [UIButton]?) -> UITableViewCell {
        
        guard let cell = (tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? ProductCell)else {
            
            return UITableViewCell()
        }
        
        cell.configureWithModel(model: self, indexPath: indexPath)
        return cell
    }
    
}
