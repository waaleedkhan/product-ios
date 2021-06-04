//  Created on 6/4/21.

import Foundation

struct ProductsProvider {
    
    // MARK: - Members
    
    let apiRepo: ProductsAPIRepository = ProductsAPIRepository()
    
    // MARK: - Provider Methods
    
    func getAllProducts(completion: @escaping ServiceResponse) {
        // Here we make decision which Repository to use. It can either be API Repo or Local (CoreData, Realm Repo)
        apiRepo.getAll(callback: completion)
    }
    
}
