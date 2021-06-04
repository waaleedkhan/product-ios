//  Created on 6/4/21.

import Foundation

protocol ProductServicing {
    
    func getAll(completion: @escaping ServiceResponse)
    
}

struct ProductService {
    
    // MARK: - Get All
    
    struct GetAll {
        
        // MARK: - Members
        
        var completion: ServiceResponse
        private let serviceURL = URL(string: "\(Constants.EndPoints.baseURL)\(Constants.EndPoints.getProducts)")
        
        // MARK: - Call
        
        func get() {
            guard let serviceURL = self.serviceURL else {
                completion(.failure(nil))
                return
            }
            
            URLSession.shared.dataTask(with: serviceURL) { responseData, _, error in
                guard error == nil else {
                    completion(.failure(error))
                    return
                }
                
                guard let unwrapData = responseData else {
                    completion(.failure(error))
                    return
                }
                
                do {
                    let decodedData = try ProductsResponse.decode(data: unwrapData)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(error))
                }
            }.resume()
        }
        
    }
    
}

extension ProductService: ProductServicing {
    
    func getAll(completion: @escaping ServiceResponse) {
        GetAll(completion: completion).get()
    }
    
}
