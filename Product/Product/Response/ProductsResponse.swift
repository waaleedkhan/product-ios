//  Created on 6/4/21.

import Foundation

struct Page: Codable {}

struct ProductsResponse: Codable {
    
    // MARK: - Members
    
    let results: [Product]
    let pagination: Page
    
}
