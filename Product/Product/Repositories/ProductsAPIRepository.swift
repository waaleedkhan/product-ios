//  Created on 6/4/21.

import Foundation

class ProductsAPIRepository: Repository {
    
    // MARK: - Members
    
    private let service: ProductServicing
    
    // MARK: - Life Cycle Methods
    
    init(service: ProductServicing) {
        self.service = service
    }
    
    // MARK: - Repository Implementation
    
    func get(by: Int) -> Product? { return nil }
    
    func delete() -> Product? { return nil }
    
    func getAll(callback: @escaping ServiceResponse) {
        service.getAll(completion: callback)
    }
    
}
