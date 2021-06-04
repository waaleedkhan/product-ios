//  Created on 6/4/21.

import Foundation

struct Page: Codable {}

struct ProductsResponse: Codable {
    
    // MARK: - Members
    
    let result: [Product]
    let pagination: Page
    
}
