//  Created on 6/5/21.

import UIKit

class ProductCell: TableViewCell {

    // MARK: - Members
    
    var indexPath: IndexPath?
    var model: Product?
    
    // MARK: - Outlets
    
    @IBOutlet weak var imageViewThumbnail: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblCreatedAt: UILabel!
    
    // MARK: - Life Cycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initalize()
    }
    
    private func initalize() {
        imageViewThumbnail.backgroundColor = .blue
        imageViewThumbnail.layer.cornerRadius = imageViewThumbnail.frame.size.width / 2.0
    }

    func configureWithModel(model: Product, indexPath: IndexPath) {
        self.model = model
        self.indexPath = indexPath
        
        setData(model: model)
    }
    
    private func setData(model: Product) {
        lblName.text = model.name
        lblPrice.text = model.price
        lblCreatedAt.text = model.createdAt?.toDisplayFormat()
    }
    
}
