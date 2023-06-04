
import UIKit

class DetailWireframe: WireframeProtocol {

    var view: DetailViewController!
    var interactor: Any?
    var presenter: DetailPresenter! = DetailPresenter()

    weak var navigationController: UINavigationController?

    init(card: CardsTableItemModel) {
        view = View.load(presenter: presenter)

        presenter.view = view
        presenter.wireframe = self
        presenter.setCard(card: card)
    }
}
