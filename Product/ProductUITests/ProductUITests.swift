//  Created on 6/4/21.

import XCTest

class ProductUITests: XCTestCase {

    let app: XCUIApplication = XCUIApplication()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testProductsListLoadedWithDetail() throws {
        guard expect(element: app.staticTexts["Products"], status: .hittable) else {
            XCTFail()
            return
        }
        
        let firstCell = self.app.tables.cells.element(boundBy: 0)
        
        guard expect(element: firstCell, status: .hittable) else {
            XCTFail()
            return
        }
        
        let nameOnCell = firstCell.staticTexts["kProductCellName"].label
        let priceOnCell = firstCell.staticTexts["kProductCellPrice"].label
        let createdAtOnCell = firstCell.staticTexts["kProductCellCreatedAt"].label
        
        firstCell.tap()
        
        let nameOnDetail = app.staticTexts["kProductDetailName"].label
        let priceOnDetail = app.staticTexts["kProductDetailPrice"].label
        let createdAtOnDetail = app.staticTexts["kProductDetailCreatedAt"].label
        
        XCTAssertEqual(nameOnDetail, "Name: \(nameOnCell)")
        XCTAssertEqual(priceOnDetail, "Price: \(priceOnCell)")
        XCTAssertEqual(createdAtOnDetail, "Created At: \(createdAtOnCell)")
    }
    
}
