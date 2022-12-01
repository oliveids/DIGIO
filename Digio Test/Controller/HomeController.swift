import UIKit

class HomeController: UIViewController {

    // MARK: - Variable And Constants
    private var models = [CollectionViewCellModel]()
    private var homeViewModel = HomeViewModel()
    let appDelegate = UIApplication.shared.delegate as? AppDelegate

    private let table: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(UITableViewCell.self,
                       forCellReuseIdentifier:  "cell")
        table.register(SpotlightTableViewCell.self,
                       forCellReuseIdentifier: SpotlightTableViewCell.identifier)
        table.register(CashTableViewCell.self,
                       forCellReuseIdentifier: CashTableViewCell.identifier)
        table.register(ProductsTableViewCell.self,
                       forCellReuseIdentifier: ProductsTableViewCell.identifier)
        return table
    }()

    // MARK: - Lifecycle
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewModel.setupApi()
        homeViewModel.delegate = self
        view.addSubview(table)
        table.backgroundColor = .white
        table.separatorColor = .clear
        table.tableHeaderView = createTableHeader()
        table.delegate = self
        table.dataSource = self
    }

    override func viewDidAppear(_ animated: Bool) {
       super.viewDidAppear(animated)
        LockOrientationApp.lockOrientation(.portrait)
   }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    // MARK: - Func
    private func createTableHeader() -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0,
                                              y: 0,
                                              width: view.frame.size.width,
                                              height: 50))
        let imageProfile = UIImageView(frame: CGRect(x: 10, y: 20, width: 30, height: 30))
        imageProfile.image = UIImage(named: "iconProfile")
        headerView.addSubview(imageProfile)

        let lblName = UILabel(frame: CGRect(x: 50, y: 20, width: 100, height: 30))
        lblName.text = "Olá, Danilo"
        lblName.textColor = .black
        headerView.addSubview(lblName)

        return headerView
    }

    func setupModels() {
        if let spotlight = self.homeViewModel.codableResultHome?.spotlight {
            models.append(.collectionView(models: spotlight,
                                          rows: 2))
        }
        if let cash = self.homeViewModel.codableResultHome?.cash {
            models.append(.collectionViewCash(models: [cash],
                                              rows: 2))
        }
        if let products = self.homeViewModel.codableResultHome?.products {
            models.append(.collectionViewProducts(models: products,
                                                  rows: 2))
        }
        self.table.reloadData()
    }
}

// MARK: - Extension
extension HomeController: UITableViewDelegate, UITableViewDataSource {

    private func configureSpotlightCell(_ indexPath: IndexPath, tableview: UITableView,
                                        model: [Spotlight]) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: SpotlightTableViewCell.identifier,
                                                       for: indexPath) as? SpotlightTableViewCell
        else { return UITableViewCell() }
        cell.configure(with: model)
        cell.delegate = self
        return cell
    }

    private func configureCashCell(_ indexPath: IndexPath, tableview: UITableView, model: [Cash]) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: CashTableViewCell.identifier,
                                                       for: indexPath) as? CashTableViewCell
        else { return UITableViewCell() }
        cell.configure(with: model)
        cell.delegate = self
        return cell
    }

    private func configureProductsCell(_ indexPath: IndexPath, tableview: UITableView,
                                       model: [Product]) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: ProductsTableViewCell.identifier,
                                                       for: indexPath) as? ProductsTableViewCell
        else { return UITableViewCell() }
        cell.configure(with: model)
        cell.delegate = self
        return cell
    }

    func tableView( _ tableView : UITableView,  titleForHeaderInSection section: Int) -> String? {
        switch models[section] {
        case .collectionView: return "Spotlight"
        case .collectionViewCash: return "Digio Cash"
        case .collectionViewProducts: return "Produtos"
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch models[section] {
        case .collectionView: return 1
        case .collectionViewCash: return 1
        case .collectionViewProducts: return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch models[indexPath.section] {
        case .collectionView(let models, _):
            return configureSpotlightCell(indexPath, tableview: tableView, model: models)
        case .collectionViewCash(let models, _):
            return configureCashCell(indexPath, tableview: tableView, model: models)
        case .collectionViewProducts(let models, _):
            return configureProductsCell(indexPath, tableview: tableView, model: models)
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch models[indexPath.section] {
        case .collectionView(_, let rows): return 100 * CGFloat(rows)
        case .collectionViewCash(_, let rows): return 60 * CGFloat(rows)
        case .collectionViewProducts(_, let rows): return 55 * CGFloat(rows)
        }
    }
}

extension HomeController: CollectionTableViewCellDelegate {
    func didSelectItemSpotlight(with model: Spotlight) {
        if let navigation = self.navigationController {
            self.showLoading(enable: true)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.showLoading(enable: false)
                self.homeViewModel.goToResult(model: ResultCollectionViewCellModel(description:
                                                                                    model.spotlightDescription,
                                                            image: model.bannerURL), controller: navigation)
            }
        }
    }

    func didSelectItemCash(with model: Cash) {
        self.showLoading(enable: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if let navigation = self.navigationController {
                self.showLoading(enable: false)
                self.homeViewModel.goToResult(model: ResultCollectionViewCellModel(description:
                                                                                    model.cashDescription,
                                                            image: model.bannerURL), controller: navigation)
            }
        }
    }

    func didSelectItemProduct(with model: Product) {
        self.showLoading(enable: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            if let navigation = self.navigationController {
                self.showLoading(enable: false)
                self.homeViewModel.goToResult(model: ResultCollectionViewCellModel(description:
                                                                                    model.productDescription,
                                                            image: model.imageURL), controller: navigation)
            }
        }
    }
}

extension HomeController: HomeViewModelDelegate {

    func successRequest() {
        setupModels()
    }

    func failureRequest(_ error: Error) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.simplePopUp(title: "Erro:", mensage: "Tente novamente mais tarde.")
        }
    }
}
