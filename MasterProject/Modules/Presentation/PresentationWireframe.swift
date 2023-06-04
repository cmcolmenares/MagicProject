
import UIKit

class PresentationWireframe: WireframeProtocol, Navigable {
    static let shared: PresentationWireframe = PresentationWireframe()

    var view: PresentationViewController!
    var interactor: Any?
    var presenter: PresentationPresenter! = PresentationPresenter()

    var navigationController: UINavigationController?

    init() {
        view = View.load(presenter: presenter)

        presenter.view = view
        presenter.wireframe = self
    }
    
    func navigateToHome() {
        guard let navigationController = navigationController else { return }
        let wireframe = HomeWireframe.shared
        wireframe.navigationController = navigationController
        wireframe.push(in: navigationController)
    }
}
