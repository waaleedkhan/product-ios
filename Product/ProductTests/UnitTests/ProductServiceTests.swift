//  Created on 6/6/21.

import XCTest
@testable import Product

class ProductServiceTests: XCTestCase {
    
    // MARK: - Life Cycle Methods
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testViewModelAPISuccess() throws {
        //Arrange
        let provider = ProductsProvider(service: ProductServiceSuccessMock())
        let viewModel = ProductsViewModel(provider: provider)
        
        viewModel.getProducts()
        
        XCTAssertEqual(viewModel.getNumberOfProducts(), 1, "Number of Products Not Equal")
        XCTAssertNotNil(viewModel.getProduct(indexPath: IndexPath(row: 0, section: 0)), "Product At Index Nil")
    }

    func testViewModelAPIFailed() throws {
        //Arrange
        let provider = ProductsProvider(service: ProductServiceFailureMock())
        let viewModel = ProductsViewModel(provider: provider)
        
        viewModel.getProducts()
        
        XCTAssertEqual(viewModel.getNumberOfProducts(), 0, "Number of Products Not Equal")
    }
    
    func testAPIReturnsNoProducts() throws {
        //Arrange
        let provider = ProductsProvider(service: ProductServiceSuccessWithEmptyMock())
        let viewModel = ProductsViewModel(provider: provider)
        
        viewModel.getProducts()
        
        XCTAssertEqual(viewModel.getNumberOfProducts(), 0, "Number of Products Not Equal")
    }
    
    func testAPIReturnsNullResponse() throws {
        //Arrange
        let provider = ProductsProvider(service: ProductServiceSuccessWithNullResponseMock())
        let viewModel = ProductsViewModel(provider: provider)
        
        viewModel.getProducts()
        
        XCTAssertEqual(viewModel.getNumberOfProducts(), 0, "Number of Products Not Equal")
    }
    
}
