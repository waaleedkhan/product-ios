//  Created on 6/5/21.

import Foundation

extension Date {

    func toDisplayFormat() -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = Constants.Format.displayDateFormat.rawValue
        formatter.timeZone = TimeZone(identifier: "UTC")
        return formatter.string(from: self)
    }
    
}
