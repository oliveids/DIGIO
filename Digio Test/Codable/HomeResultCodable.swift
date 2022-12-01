import UIKit

// MARK: - HomeResultCodable
struct HomeResultCodable: Codable {
    let spotlight: [Spotlight]
    let products: [Product]
    let cash: Cash
}

// MARK: - Cash
struct Cash: Codable {
    let title: String
    let bannerURL: String
    let cashDescription: String

    enum CodingKeys: String, CodingKey {
        case title, bannerURL
        case cashDescription = "description"
    }
}

// MARK: - Product
struct Product: Codable {
    let name: String
    let imageURL: String
    let productDescription: String

    enum CodingKeys: String, CodingKey {
        case name, imageURL
        case productDescription = "description"
    }
}

// MARK: - Spotlight
struct Spotlight: Codable {
    let name: String
    let bannerURL: String
    let spotlightDescription: String

    enum CodingKeys: String, CodingKey {
        case name, bannerURL
        case spotlightDescription = "description"
    }
}
