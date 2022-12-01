import UIKit
import SDWebImage

class SpotlighCollectionViewCell: UICollectionViewCell {

    static let indentifier = "SpotlighCollectionViewCell"

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

    private let spotlighImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10.5
        imageView.layer.masksToBounds = true
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(backgroundImageView)
        contentView.addSubview(spotlighImageView)
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

        spotlighImageView.frame = CGRect(x: 0,
                                   y: 0,
                                   width: contentView.frame.size.width-0,
                                   height: contentView.frame.size.height-0)
    }

    public func configure(with model: Spotlight) {
        let url = NSURL(string: model.bannerURL)
        spotlighImageView.sd_setImage(with: url! as URL)
    }
}
