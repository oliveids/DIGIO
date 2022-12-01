import UIKit

class HomeUseCase {
    static var get:  Resource<HomeResultCodable> = {
        guard let url = URL(string: Constants.APIUrl.baseUrl) else {
            fatalError("URL is incorrect!")
        }
        return Resource<HomeResultCodable>(url: url)
    }()
}
