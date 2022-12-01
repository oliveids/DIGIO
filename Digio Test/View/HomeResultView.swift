import UIKit

class HomeResultView: UIView {

    var bannerImage: UIImageView = {
        var img = UIImageView()
        img.contentMode = .scaleToFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()

    var descriptionLabel: UITextView = {
        var lbl = UITextView()
        lbl.textColor = .black
        lbl.backgroundColor = .clear
        lbl.isEditable = false
        lbl.font = UIFont.systemFont(ofSize: 17)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubviews()
    }

    func createSubviews() {
        backgroundColor = .white
        setupResultImage()
        setupMainLabel()
    }

    func setupResultImage() {
        addSubview(bannerImage)
        NSLayoutConstraint.activate([
            bannerImage.topAnchor.constraint(equalTo: topAnchor),
            bannerImage.widthAnchor.constraint(equalTo: widthAnchor),
            bannerImage.heightAnchor.constraint(equalToConstant: size.height * 0.27)
        ])
    }
    func setupMainLabel() {
        addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: bannerImage.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: bannerImage.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: bannerImage.trailingAnchor, constant: -20),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 20)
        ])
    }
}
