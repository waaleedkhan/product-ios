//  Created on 6/5/21.

import Foundation
import UIKit

extension BaseController {
    
    func getViewName() -> String {
        var file = "\(String(describing: type(of: self)).split(separator: ".").last!)"
        let regex = "\\w*Controller(<\\w+>)?$"
        let matches = file.matchingStrings(regex: regex)
        
        if matches.isEmpty {// !file.hasSuffix("Controller") {
            throwException(message: "Invalid class name. Name should end with string 'controller' (e.g. SampleController)")
        }
        if let match = matches.first, match.count >= 2 {
            file = file.replacingOccurrences(of: match[1], with: "")
        }
        
        return file.replacingOccurrences(of: "Controller", with: "View")
    }
    
    func loadView(viewName: String) {
        if Bundle.main.path(forResource: viewName, ofType: "nib") == nil {
            throwException(message: "\(viewName) nib/class not found in project.")
        }
        let nibs: UINib = UINib(nibName: viewName, bundle: nil)
        
        let array: [AnyObject] = nibs.instantiate(withOwner: nil, options: nil) as [AnyObject]
        if array.isEmpty {
            throwException(message: "\(viewName) nib doesn't have any view (IB error)")
        }
        
        if !(array[0] is BaseView) {
            throwException(message: "\(viewName) nib should be subclass of \(viewName) -> BaseView (IB error).")
        }
        
        let view: BaseView = (array[0] as? BaseView)!
        view.controller = self
        self.view = view
    }
    
}
