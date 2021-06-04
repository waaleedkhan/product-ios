//  Created on 6/4/21.

import Foundation

enum ProductsDataViewState {
    
    case loading
    case error(error: Error?)
    case success
    case productsNotFound(message: String)
    
}

class ProductsViewModel {
    
    // MARK: - Members
    
    let provider: ProductsProvider
    var onStateChange: ((ProductsDataViewState) -> Void)?
    
    var products = [Product]()
    
    // MARK: - Life Cycle Methods
    
    init(provider: ProductsProvider) {
        self.provider = provider
    }
    
    private func update(state: ProductsDataViewState) {
        onStateChange?(state)
    }
    
    // MARK: - API Calls
    
    func getProducts() {
        provider.getAllProducts { [weak self] result in
            switch result {
            case .success(let response):
                self?.getProductsSuccess(response: response)
            case .failure(let error):
                self?.getProductsFailed(error: error)
            }
        }
    }
    
    // MARK: - API Callbacks
    
    func getProductsSuccess(response: Decodable?) {
        let stateProductNotFound = ProductsDataViewState.productsNotFound(message: "")
        
        guard let products = (response as? ProductsResponse)?.result else {
            update(state: stateProductNotFound)
    
            return
        }
        
        if products.isEmpty {
            update(state: stateProductNotFound)
            return
        }
        
        update(state: .success)
    }
    
    func getProductsFailed(error: Error?) {
        update(state: .error(error: error))
    }
    
}
