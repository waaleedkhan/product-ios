//  Created on 6/5/21.

import Foundation

protocol ErrorHandling {
    
    func throwException(message: String)
    
}

extension ErrorHandling {
    
    func throwException(message: String) {
        let exception = NSException(name: NSExceptionName(rawValue: message), reason: nil, userInfo: nil)
        exception.raise()
    }
    
}
