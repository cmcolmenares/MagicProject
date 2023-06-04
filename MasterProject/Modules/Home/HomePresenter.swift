
import Foundation

final class HomePresenter: PresenterProtocol {
    var view: HomeViewController!
    var wireframe: HomeWireframe!
    var interactor: HomeInteractor?
    
    var model: CardsTableModel? {
        didSet {
            self.view.reloadView()
        }
    }
    
    func viewDidLoad() {
        getData()
    }
    
    // MARK: - Presenter funcs
    
    func getData() {
        view.showSpinner()
        interactor?.fetchData(completion: { [weak self] model in
            guard let model = model else { return }
            self?.model = model
            self?.view.hideSpinner()
        })
    }
    
    func navidateToDetail(indexPath: IndexPath) {
        guard let card = model?.items[indexPath.row] else { return }
        
        wireframe.navigateToDetail(with: card)
    }
    
}
