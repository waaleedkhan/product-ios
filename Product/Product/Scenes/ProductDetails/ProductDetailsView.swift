//  Created on 6/5/21.

import UIKit

class ProductDetailsView: BaseView {

    // MARK: - Outlets
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblCreatedAt: UILabel!
    
    @IBOutlet weak var collectionViewImages: CollectionView!
    
    // MARK: Members
    
    private var productImages = [ProductImage]()
    
    // MARK: - Life cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initalize()
    }
    
    private func initalize() {
        collectionViewImages.register(ProductImageCell.Nib, forCellWithReuseIdentifier: ProductImageCell.reuseIdentifier)
        collectionViewImages.dataSource = collectionViewImages
        collectionViewImages.delegate = self
        
        lblName.accessibilityIdentifier = "kProductDetailName"
        lblPrice.accessibilityIdentifier = "kProductDetailPrice"
        lblCreatedAt.accessibilityIdentifier = "kProductDetailCreatedAt"
    }
    
    // MARK: - Setup UI
    
    func setProduct(_ product: Product) {
        lblName.text = "\(Strings.kTitleName): \(product.name ?? "N/A")"
        lblPrice.text = "\(Strings.kTitlePrice): \(product.price ?? "N/A")"
        lblCreatedAt.text = "\(Strings.kTitleCreatedAt): \(product.createdAt?.toDisplayFormat() ?? "N/A")"
        
        prepareProductImages(imageUrls: product.imageUrls ?? [])
    }
    
    private func prepareProductImages(imageUrls: [String]) {
        productImages = imageUrls.map({ ProductImage(imageUrl: $0)})
        
        collectionViewImages.data = productImages
    }
    
}

// MARK: - Collection View Delegate Methods

extension ProductDetailsView: UICollectionViewDelegate {
    
}

extension ProductDetailsView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.frame.size.width, height: 200.0)
    }
}
