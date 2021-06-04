//  Created on 6/4/21.

import Foundation

extension Decodable {
    
    static func decode(data: Data) throws -> Self {
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.Format.apiDateFormat.rawValue
        decoder.dateDecodingStrategy = .formatted(formatter)
        return try decoder.decode(Self.self, from: data)
    }
    
}
