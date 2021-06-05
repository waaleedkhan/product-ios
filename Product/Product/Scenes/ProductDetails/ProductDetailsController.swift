//  Created on 6/5/21.

import UIKit

class ProductDetailsController: BaseController {

    // MARK: - Members
    
    private let product: Product
    
    // MARK: - Life Cycle Methods
    
    init(product: Product) {
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initalize()
    }

    private func initalize() {
        title = product.name
        
        (view as? ProductDetailsView)?.setProduct(product)
    }
    
}
