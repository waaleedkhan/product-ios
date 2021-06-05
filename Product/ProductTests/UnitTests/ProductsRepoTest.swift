//  Created on 6/5/21.

import XCTest
@testable import Product


class ProductServiceSpy: ProductServicing {
    
    // MARK: - Spies
    
    var isGetAllCalled: Bool = false
    
    func getAll(completion: @escaping ServiceResponse) {
        isGetAllCalled = true
    }
    
}

class ProductsRepoTest: XCTestCase {

    // MARK: - Members
    
    var productsRepo: ProductsAPIRepository!
    var spy: ProductServiceSpy!
    
    // MARK: - Life Cycle Method
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        spy = ProductServiceSpy()
        productsRepo = ProductsAPIRepository(service: spy)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        productsRepo = nil
        spy = nil
    }
    
    // MARK: - Unit Tests
    
    func testGetAllCalledFromRepo() throws {
        productsRepo.getAll { _ in }
        XCTAssertTrue(spy.isGetAllCalled, "Get All Not Called")
    }
    
    func testProductsRepoDeleteReturnsNil() throws {
        XCTAssertNil(productsRepo.delete(), "Delete Result Not Null")
    }
    
    func testProductsRepoGetByIDReturnsNil() throws {
        XCTAssertNil(productsRepo.get(by: 1), "Get By Id Result not Null")
    }

}
