import UIKit

class HomeModel {

    // MARK: - Variable
    var spotlight: [String]
    var products: [String]
    var cashTitle: String?
    var cashBannerURL: String?
    var cashDescription: String?

    init() {
        self.spotlight = []
        self.products = []
        self.cashTitle = ""
        self.cashBannerURL = ""
        self.cashDescription = ""
    }

    init(codable: HomeResultCodable) {

        self.spotlight = []
        self.products = []
        self.cashBannerURL = codable.cash.bannerURL
        self.cashDescription = codable.cash.cashDescription

        for itemSpotlight in codable.spotlight {
            self.spotlight.append(itemSpotlight.name)
            self.spotlight.append(itemSpotlight.bannerURL)
            self.spotlight.append(itemSpotlight.spotlightDescription)
        }

        for itemProducts in codable.spotlight {
            self.spotlight.append(itemProducts.name)
            self.spotlight.append(itemProducts.bannerURL)
            self.spotlight.append(itemProducts.spotlightDescription)
        }
    }
}
