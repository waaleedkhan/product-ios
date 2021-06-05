//  Created on 6/5/21.

import UIKit

class ProductListView: BaseView {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: TableView!
 
    // MARK: - Members
    
    var viewModel: ProductsViewModel?
    
    // MARK: - Initialize
    
    func initializeData(viewModel: ProductsViewModel) {
        self.viewModel = viewModel
        registerStateEventChanges()
        
        viewModel.getProducts()
    }
    
    private func registerStateEventChanges() {
        viewModel?.onStateChange = { [weak self] state in

            guard let self = self else {
                return
            }
            
            switch state {
            case .success:
                print("Success")
                
            case .error(let error):
                print(error?.localizedDescription ?? "")
            default:
                print("Default")
            }
        }
    }
    
}
