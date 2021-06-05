//  Created on 6/4/21.

import UIKit

class BaseController: UIViewController, ErrorHandling {

    // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.loadView(viewName: self.getViewName())
        (self.view as? BaseView)?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        (self.view as? BaseView)?.viewWillAppear()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        (self.view as? BaseView)?.viewDidAppear()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        (self.view as? BaseView)?.viewWillDisappear()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        (self.view as? BaseView)?.viewDidLayoutSubviews()
    }

}
