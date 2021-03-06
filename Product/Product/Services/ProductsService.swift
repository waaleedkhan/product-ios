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
        // Ideally it should be in the Service Layer
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
                } catch let exception {
                    print(exception)
                    
                    completion(.failure(error))
                }
            }.resume()
        }
        
    }
    
}

extension ProductService: ProductServicing {
    
    func getAll(completion: @escaping ServiceResponse) {
        return GetAll(completion: completion).get()
    }
    
}
