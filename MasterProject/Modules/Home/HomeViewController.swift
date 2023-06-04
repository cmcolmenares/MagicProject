
import UIKit

class HomeViewController: ViewController<HomePresenter>, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - UI
    
    @IBOutlet weak var tableView: UITableView!
    
    private var index: IndexPath?
    
    private let itemIds = [
        String(describing: InfoCell.self)
    ]
    
    /// refresh
    let refreshControl = UIRefreshControl()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Private
    
    private func setupUI() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.layer.cornerRadius = 15.0
        tableView.tableFooterView = UIView()
        
        refreshControl.attributedTitle = NSAttributedString(string: LocalizedString("pullToRefresh").resolve())
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
        
        registerNIB()
    }
    
    private func registerNIB() {
        itemIds.forEach { itemId in
            let nib = UINib(nibName: itemId, bundle: Bundle(for: self.classForCoder))
            nib.instantiate(withOwner: self, options: nil)
            
            tableView.register(nib, forCellReuseIdentifier: itemId)
        }
    }
    
    private func setupCell(_ cell: UITableViewCell,_ indexPath: IndexPath) -> UITableViewCell {
        guard let model = presenter.model, let setupCell = cell as? InfoCell else { return cell }
        let data = model.items[indexPath.row]
        setupCell.set(name: data.name,
                      description: data.text,
                      icon: data.imageUrl)
        return setupCell
    }
    
    private func content(at indexPath: IndexPath) -> String {
        return String(describing: InfoCell.self)
    }
    
    @objc private func refresh(_ sender: AnyObject) {
        presenter.getData()
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.model?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: content(at: indexPath), for: indexPath)
        return setupCell(cell, indexPath)
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.navidateToDetail(indexPath: indexPath)
    }
    
    // MARK: - ViewMethods
    
    func reloadView() {
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
}
