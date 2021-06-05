//  Created on 6/4/21.

import Foundation
import UIKit

typealias ServiceResponse = (Result) -> Void
typealias TableViewCell = UITableViewCell & NibLoadable & ReusableView & TableViewCellProtocol
