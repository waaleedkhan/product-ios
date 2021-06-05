//  Created on 6/5/21.

import UIKit
import Combine

class ProductCell: TableViewCell {

    // MARK: - Members
    
    var indexPath: IndexPath?
    var model: Product?
    
    // Private
    private var cancellable: AnyCancellable?
    private var animator: UIViewPropertyAnimator?
    
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
    
    override public func prepareForReuse() {
         super.prepareForReuse()
        imageViewThumbnail.image = nil
        imageViewThumbnail.alpha = 0.0
        animator?.stopAnimation(true)
        cancellable?.cancel()
     }
    
    private func initalize() {
        lblName.accessibilityIdentifier = "kProductCellName"
        lblPrice.accessibilityIdentifier = "kProductCellPrice"
        lblCreatedAt.accessibilityIdentifier = "kProductCellCreatedAt"
        
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
        
        if let thumbnail = model.imageUrlsThumbnails?.first,
           let url = URL(string: thumbnail) {
            cancellable = loadImage(for: thumbnail, url: url).sink { [unowned self] image in self.showImage(image: image) }
        }
    }
    
    // MARK: - Image handling
    // https://github.com/sgl0v/OnSwiftWings/blob/master/ImageCache.playground/Sources/MovieTableViewCell.swift
    private func showImage(image: UIImage?) {
        imageViewThumbnail.alpha = 0.0
        animator?.stopAnimation(false)
        imageViewThumbnail.image = image
        animator = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.imageViewThumbnail.alpha = 1.0
        })
    }
    
    private func loadImage(for thumbnailUrl: String, url: URL) -> AnyPublisher<UIImage?, Never> {
        return Just(thumbnailUrl)
        .flatMap({ _ -> AnyPublisher<UIImage?, Never> in
            return ImageLoader.shared.loadImage(from: url)
        })
        .eraseToAnyPublisher()
    }
    
}
