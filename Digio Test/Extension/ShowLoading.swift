import UIKit

extension UIViewController {

    func showLoading(enable: Bool = true) {
        let loadingVC = LoadingViewController()
        loadingVC.modalPresentationStyle = .overCurrentContext
        loadingVC.modalTransitionStyle = .crossDissolve

        if enable {
            // inicio do load
            present(loadingVC, animated: true, completion: nil)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
