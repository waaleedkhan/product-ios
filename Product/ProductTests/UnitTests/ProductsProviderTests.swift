//  Created on 6/5/21.

import XCTest
@testable import Product

class MockProductAPIRepository: ProductsAPIRepository {
    
    var isGetAllCalled: Bool = false
    
    override func getAll(callback: @escaping ServiceResponse) {
        isGetAllCalled = true
    }
    
}

class ProductsProviderTests: XCTestCase {

    // MARK: - Members
    
    var provider: ProductsProvider!
    var mockRepo: MockProductAPIRepository!
    
    // MARK: - Life Cycle Methods
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        mockRepo = MockProductAPIRepository(service: ProductServiceSpy())
        provider = ProductsProvider(apiRepo: mockRepo)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        provider = nil
    }

    // MARK: - Unit Tests
    
    func testProviderGetAllCalled() {
        provider.getAllProducts { _ in }
        XCTAssertTrue(mockRepo.isGetAllCalled, "API Repo Get All Not Called")
    }
}
