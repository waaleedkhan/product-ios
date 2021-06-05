//  Created on 6/4/21.

import UIKit

class BaseView: UIView, ViewLifeCycle {

    weak var controller: BaseController?

    func viewDidLoad() {
        
    }
    
    func viewWillAppear() {
        
    }
    
    func viewDidAppear() {
        
    }
    
    func viewWillDisappear() {
        
    }
    
    func updateViewForOrientation(orientation: UIInterfaceOrientation) {}
    
    func viewWillUpdateOrientation() {}
    
    func viewDidLayoutSubviews() {}
    
}
