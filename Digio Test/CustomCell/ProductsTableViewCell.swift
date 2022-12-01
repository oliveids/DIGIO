import UIKit

class ProductsTableViewCell: UITableViewCell {

    // MARK: - Variable And Constants
    public weak var delegate: CollectionTableViewCellDelegate?
    private var models = [Product]()
    static let identifier = "ProductsTableViewCell"
    private let collectionView: UICollectionView

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 80, height: 90)
        layout.sectionInset = UIEdgeInsets(top: 0,
                                           left: 20,
                                           bottom: 0,
                                           right: 3)
        self.collectionView = UICollectionView(frame: .zero,
                                               collectionViewLayout: layout)
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(ProductsCollectionViewCell.self,
                                forCellWithReuseIdentifier: ProductsCollectionViewCell.indentifier)
        collectionView.delegate = self
        collectionView.dataSource = self

        contentView.addSubview(collectionView)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }

    public func configure (with models: [Product]) {
        self.models = models
        collectionView.reloadData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - extension
extension ProductsTableViewCell: UICollectionViewDelegate,
                                 UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private func configureCell(_ indexPath: IndexPath, collectionview: UICollectionView,
                               _ model: Product) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductsCollectionViewCell.indentifier,
                                                            for: indexPath) as? ProductsCollectionViewCell
        else { return UICollectionViewCell() }
        cell.configure(with: model)
        return cell
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[indexPath.row]
        return configureCell(indexPath, collectionview: collectionView, model)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = models[indexPath.row]
        collectionView.deselectItem(at: indexPath, animated: true)
        delegate?.didSelectItemProduct(with: model)
    }
}
