
import UIKit

class HomeWireframe: WireframeProtocol {

static let shared: HomeWireframe = HomeWireframe()

    var view: HomeViewController!
    var interactor: HomeInteractor? = HomeInteractor()
    var presenter: HomePresenter! = HomePresenter()

    weak var navigationController: UINavigationController?

    init() {
        view = View.load(presenter: presenter)

        presenter.view = view
        presenter.wireframe = self
        presenter.interactor = interactor
    }
    
    func navigateToDetail(with card: CardsTableItemModel) {
        guard let navigationController = navigationController else { return }
        let wireframe = DetailWireframe(card: card)
        wireframe.navigationController = navigationController
        wireframe.push(in: navigationController)
    }
}
