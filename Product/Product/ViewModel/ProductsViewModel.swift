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
    
    private let provider: ProductsProvider
    var onStateChange: ((ProductsDataViewState) -> Void)?
    
    private var products = [Product]()
    
    // MARK: - Life Cycle Methods
    
    init(provider: ProductsProvider) {
        self.provider = provider
    }
    
    private func update(state: ProductsDataViewState) {
        DispatchQueue.main.async {
            self.onStateChange?(state)
        }
    }
    
    // MARK: - Data
    
    func getNumberOfProducts() -> Int {
        return products.count
    }
    
    func getProduct(indexPath: IndexPath) -> Product? {
        return products[indexPath.row]
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
        let stateProductNotFound = ProductsDataViewState.productsNotFound(message: Strings.kMessageNoProductsFound)
        
        guard let products = (response as? ProductsResponse)?.results else {
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
