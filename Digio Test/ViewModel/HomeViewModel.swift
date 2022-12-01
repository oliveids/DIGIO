import UIKit
import RxSwift

protocol HomeViewModelDelegate: AnyObject {
    func successRequest()
    func failureRequest(_ error: Error)
}

class HomeViewModel {

    // MARK: - Variable And Constants
    private var model: HomeModel = HomeModel()
    weak var delegate: HomeViewModelDelegate?
    var disposable: DisposeBag = DisposeBag()
    var codableResultHome: HomeResultCodable?

    // MARK: - Func
    func setupApi() {
        APIService().load(resource: HomeUseCase.get).asObservable()
            .subscribe(
                onNext: { result in
                    print("Sucesso!!!", result)
                    self.codableResultHome = result
                    self.delegate?.successRequest()
                },
                onError: { error in
                    print("Error ", error)
                    self.delegate?.failureRequest(error)
                }).disposed(by: disposable)
    }

    func goToResult(model: ResultCollectionViewCellModel,controller: UINavigationController) {
        let viewController = HomeResultController(model: model)
        controller.pushViewController(viewController, animated: true)
    }
}
