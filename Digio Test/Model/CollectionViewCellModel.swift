import UIKit

enum CollectionViewCellModel {
    case collectionView(models: [Spotlight], rows: Int)
    case collectionViewCash(models: [Cash], rows: Int)
    case collectionViewProducts(models: [Product], rows: Int)
}
