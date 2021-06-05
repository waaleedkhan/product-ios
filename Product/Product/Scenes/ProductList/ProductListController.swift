//  Created on 6/5/21.

import UIKit

class ProductListController: BaseController {

    // MARK: - Members
    
    let viewModel: ProductsViewModel
    
    // MARK: - Life Cycle Methods
    
    init(viewModel: ProductsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initialize()
        initializeData()
    }
    
    private func initialize() {
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = Strings.kTitleProducts
    }
    
    private func initializeData() {
        (view as? ProductListView)?.initializeData(viewModel: viewModel)
    }
    
}
