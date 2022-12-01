import UIKit
import SDWebImage

class HomeResultController: UIViewController {

    // MARK: - Variable
    var presentationView: HomeResultView = HomeResultView()
    var result: ResultCollectionViewCellModel?

    // MARK: - init
    init(model: ResultCollectionViewCellModel) {
        super.init(nibName: nil, bundle: nil)
        self.result = model
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func loadView() {
        view = presentationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.presentationView.descriptionLabel.text = self.result?.description

        if let url = NSURL(string: self.result?.image ?? "") {
            CheckImageUrl().checkUrl(url: url as URL) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let image):
                    self.presentationView.bannerImage.image = image
                case .failure:
                    self.presentationView.bannerImage.image = UIImage(named: "error")
                }
            }
        }
    }
    
    func failureRequest(_ error: Error) {
        switch error {
        case NetworkError.decodingError:
            print("")
            break
        case NetworkError.domainError:
            print("")
            break
        case NetworkError.urlError:
            print("")
            break
        case NetworkError.unauthorized:
            print("")
            break
        case NetworkError.serverError:
            print("")
            break
        default:
            print("")
        }
    }

    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
        self.showLoading(enable: false)
    }
}
