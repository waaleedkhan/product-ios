//  Created on 6/5/21.

import Foundation
@testable import Product

struct ProductServiceSuccessMock: ProductServicing {
    
    func getAll(completion: @escaping ServiceResponse) {
        let results: [Product] = [Product(createdAt: Date(),
                                          price: "AED 20",
                                          name: "My Mock Sock",
                                          uid: "Mock ID",
                                          imageIds: ["www.temp.com"],
                                          imageUrls: ["www.temp.com"],
                                          imageUrlsThumbnails: ["tumbnails"])]
        let pagination = Page()
        let response = ProductsResponse(results: results, pagination: pagination)
        
        return completion(.success(response))
    }

}

struct ProductServiceSuccessWithEmptyMock: ProductServicing {
    
    func getAll(completion: @escaping ServiceResponse) {
        let pagination = Page()
        let response = ProductsResponse(results: [], pagination: pagination)
        
        return completion(.success(response))
    }

}

struct ProductServiceSuccessWithNullResponseMock: ProductServicing {
    
    func getAll(completion: @escaping ServiceResponse) {
        return completion(.success(nil))
    }

}


struct ProductServiceFailureMock: ProductServicing {
    
    func getAll(completion: @escaping ServiceResponse) {
        return completion(.failure(NSError(domain: "testDomain", code: 400, userInfo: nil)))
    }
    
}
