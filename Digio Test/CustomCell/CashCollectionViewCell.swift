import UIKit
import SDWebImage

class CashCollectionViewCell: UICollectionViewCell {

    static let indentifier = "CashCollectionViewCell"

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

    private let cashImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10.5
        imageView.layer.masksToBounds = true
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(backgroundImageView)
        contentView.addSubview(cashImageView)
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

        cashImageView.frame = CGRect(x: 0,
                                   y: 0,
                                   width: contentView.frame.size.width-0,
                                   height: contentView.frame.size.height-0)
    }

    public func configure(with model: Cash) {
        let url = NSURL(string: model.bannerURL)
        cashImageView.sd_setImage(with: url! as URL)
    }
}
