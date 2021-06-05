//  Created on 6/5/21.

import UIKit
import Combine

class ProductImageCell: CollectionViewCell {
    
    // MARK: - Members
    
    var indexPath: IndexPath?
    var model: ProductImage?
    
    // Private
    private var cancellable: AnyCancellable?
    private var animator: UIViewPropertyAnimator?
    
    // MARK: - Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Life Cycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override public func prepareForReuse() {
         super.prepareForReuse()
        imageView.image = nil
        imageView.alpha = 0.0
        animator?.stopAnimation(true)
        cancellable?.cancel()
     }

    func configureWithModel(model: ProductImage, indexPath: IndexPath) {
        self.model = model
        self.indexPath = indexPath
        
        setData(model: model)
    }
    
    private func setData(model: ProductImage) {
        let imageUrl = model.imageUrl
        
        guard let url = URL(string: imageUrl) else {
            return
        }
        
        cancellable = loadImage(for: imageUrl, url: url).sink { [unowned self] image in self.showImage(image: image) }
    }
    
    // MARK: - Image handling
    // https://github.com/sgl0v/OnSwiftWings/blob/master/ImageCache.playground/Sources/MovieTableViewCell.swift
    private func showImage(image: UIImage?) {
        imageView.alpha = 0.0
        animator?.stopAnimation(false)
        imageView.image = image
        animator = UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.imageView.alpha = 1.0
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
