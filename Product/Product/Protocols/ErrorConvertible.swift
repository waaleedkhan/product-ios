//  Created on 6/4/21.

import Foundation

protocol ErrorConvertible {
    
    func errorMessage() -> String
    func errorCode() -> Int
    func debugMessage() -> String?
    func statusCode() -> Int
    func isExternalError() -> Bool
    
}

extension ErrorConvertible {

    func errorMessage() -> String {
        return "Something went wrong!"
    }
    
    func errorCode() -> Int {
        return 0
    }
    
    func debugMessage() -> String? {
        return nil
    }
    
    func statusCode() -> Int {
        return 0
    }
    
    func isExternalError() -> Bool {
        return false
    }
    
}
