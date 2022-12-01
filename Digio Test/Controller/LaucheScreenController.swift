import UIKit

class LaucheScreenController: UIViewController {

    var presentationView: LaunheScreenView = LaunheScreenView()

    override func loadView() {
        view = presentationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let viewController = HomeController()
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
