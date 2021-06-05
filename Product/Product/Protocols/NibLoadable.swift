//  Created on 6/5/21.

import Foundation
import UIKit

protocol NibLoadable { }

extension NibLoadable where Self: UIView {
    
    static var NibName: String {
        return String(describing: self)
    }
    
    static var Nib: UINib {
        return UINib(nibName: NibName, bundle: nil)
    }
    
}
