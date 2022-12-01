import UIKit

class ProductsCollectionViewCell: UICollectionViewCell {

    static let indentifier = "ProductsCollectionViewCell"

    private let backgroundImageView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowOpacity = 0.6
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = CGSize.init(width: 3, height: 3)
        view.layer.cornerRadius = 10.5
        view.layer.masksToBounds = false
        return view
    }()

    private let productsImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(backgroundImageView)
        contentView.addSubview(productsImageView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        backgroundImageView.frame = CGRect(x: 0,
                                           y: 0,
                                           width: contentView.frame.size.width-0,
                                           height: contentView.frame.size.height-0)
        productsImageView.frame = CGRect(x: 15,
                                         y: 20,
                                         width: contentView.frame.size.width-30,
                                         height: contentView.frame.size.height-40)
    }
    public func configure(with model: Product) {
        if let url = NSURL(string: model.imageURL) {
            CheckImageUrl().checkUrl(url: url as URL) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let image):
                    self.productsImageView.image = image
                case .failure:
                    self.productsImageView.image = UIImage(named: "error")
                }
            }
        }
    }
}
