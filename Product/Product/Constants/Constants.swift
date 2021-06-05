//  Created on 6/4/21.

import Foundation

struct Constants {
    
    // Endpoints
    
    struct EndPoints {
        
        static let baseURL: String = "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/default/"
        static let getProducts: String = "dynamodb-writer"
        
    }
    
    enum Format: String {
        
        case apiDateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        
    }
}
