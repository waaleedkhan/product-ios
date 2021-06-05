//  Created on 6/4/21.

import Foundation

struct ProductsProvider {
    
    // MARK: - Members
    
    private let apiRepo: ProductsAPIRepository
    
    // MARK: - Life Cycle Methods
    
    init(service: ProductServicing) {
        self.apiRepo = ProductsAPIRepository(service: service)
    }
    
    init(apiRepo: ProductsAPIRepository) {
        self.apiRepo = apiRepo
    }
    
    // MARK: - Provider Methods
    
    func getAllProducts(completion: @escaping ServiceResponse) {
        // Here we make decision which Repository to use. It can either be API Repo or Local (CoreData, Realm Repo)
        apiRepo.getAll(callback: completion)
    }
    
}
