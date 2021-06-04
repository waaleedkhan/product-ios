//  Created on 6/4/21.

import Foundation

struct ProductsAPIRepository {
    
    // MARK: - Members
    
    private let service: ProductServicing
    
    // MARK: - Life Cycle Methods
    
    init(service: ProductService) {
        self.service = service
    }
    
}

// MARK: - Repository Implementation

extension ProductsAPIRepository: Repository {
    
    func get(by: Int) -> Product? { return nil }
    
    func delete() -> Product? { return nil }
    
    func getAll(callback: @escaping ServiceResponse) {
        service.getAll(completion: callback)
    }
    
}
