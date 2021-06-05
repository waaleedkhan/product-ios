//  Created on 6/5/21.

import Foundation
import UIKit

protocol ReusableView: class { }

extension ReusableView where Self: UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}
