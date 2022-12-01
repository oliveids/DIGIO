import UIKit

protocol CollectionTableViewCellDelegate: AnyObject {
    func didSelectItemSpotlight(with model: Spotlight)
    func didSelectItemProduct(with model: Product)
    func didSelectItemCash(with model: Cash)
}
