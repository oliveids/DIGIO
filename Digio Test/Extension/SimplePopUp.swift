import UIKit

extension UIViewController {

    func simplePopUp(title: String, mensage: String) {

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let alert = UIAlertController(title: title, message: mensage, preferredStyle: .alert)
            let confirm = UIAlertAction(title: "OK", style: .default, handler: { _ in
            })
            alert.addAction(confirm)
            DispatchQueue.main.async(execute: {
                self.present(alert, animated: true)
            })
        }

    }
}
