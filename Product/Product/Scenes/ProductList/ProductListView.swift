//  Created on 6/5/21.

import UIKit

class ProductListView: BaseView {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: TableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var lblErrorMessage: UILabel!
    
    // MARK: - Members
    
    private var viewModel: ProductsViewModel?
    private let kCellHeight: CGFloat = 94.0
    
    // MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initalizeTableView()
    }
    
    // MARK: - Initialize
    
    private func initalizeTableView() {
        tableView.register(ProductCell.Nib, forCellReuseIdentifier: ProductCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
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
            case .loading:
                self.showLoader()
            case .success:
                self.refresh()
            case .error(let error):
                self.handleError(error: error)
            case .productsNotFound(let message):
                self.showError(message: message)
            }
        }
    }
    
    private func refresh() {
        hideLoader()
        self.tableView.isHidden = false
        self.tableView.reloadData()
        
        self.lblErrorMessage.isHidden = true
    }
    
    // MARK: - Error Handling
    
    private func handleError(error: Error?) {
        hideLoader()
        showError(message: error?.localizedDescription ?? Strings.kMessageUnknownError)
    }
    
    private func showError(message: String) {
        tableView.isHidden = true

        lblErrorMessage.isHidden = false
        lblErrorMessage.text = message
    }
    
    // MARK: - Loader handling
    
    private func showLoader() {
        activityIndicator.startAnimating()
    }
    
    private func hideLoader() {
        activityIndicator.stopAnimating()
    }
    
}

// MARK: - UITableView Datasource Methods

extension ProductListView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getNumberOfProducts() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let product = viewModel?.getProduct(indexPath: indexPath) else {
            return UITableViewCell()
        }
        
        let cell = product.cellForTableView(tableView: tableView, atIndexPath: indexPath, actionButtons: [])
        
        return cell
    }
    
}

// MARK: UITableView Delegate Methods

extension ProductListView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kCellHeight
    }
    
}
