//  Created on 6/4/21.

import Foundation

struct ProductsAPIRepository {}

// MARK: - Repository Implementation

extension ProductsAPIRepository: Repository {
    
    func get(by: Int) -> Product? { return nil }
    
    func delete() -> Product? { return nil }
    
    func getAll(callback: ServiceResponse) {}
    
}
