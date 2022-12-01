import UIKit

class CheckImageUrl {

    func checkUrl(url: URL, completion: @escaping (Result<UIImage, Error>) -> Void ) {

        let dataTask = URLSession.shared.dataTask(with: url as URL) { (data, _, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            if let data = data {
                DispatchQueue.main.async {
                    if let image = UIImage(data: data) {
                        completion(.success(image))
                    } else {
                        completion(.failure(NSError(domain: "", code: 0, userInfo: nil)))
                    }
                }
            }
        }
        dataTask.resume()
    }
}
