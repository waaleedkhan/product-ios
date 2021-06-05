//  Created on 6/6/21.

import Foundation
import XCTest

enum UIElementStatus: String {
    
    case exists = "exists == true"
    case notExist = "exists == false"
    case hittable = "hittable == true"
    case unHittable = "hittable == false"
    
}

func expect(element: XCUIElement, status: UIElementStatus, timeout: TimeInterval = 300) -> Bool {
    
    let expectation = XCTNSPredicateExpectation(predicate: NSPredicate(format: status.rawValue), object: element)
    let result = XCTWaiter.wait(for: [expectation], timeout: timeout)
    return result == .completed
}

func tap(element: XCUIElement, timeout: TimeInterval = 300) -> Bool {
    
    guard expect(element: element, status: .hittable, timeout: timeout) else {
        
        return false
    }
    element.tap()
    return true
}
