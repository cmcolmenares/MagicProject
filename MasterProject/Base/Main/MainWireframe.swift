
import UIKit

final class MainWireframe: WireframeProtocol {

    var view: MainViewController!
    var interactor: AnyObject?
    var presenter: MainPresenter! = MainPresenter()

    var mainNavigationController: UINavigationController!

    var presentationWireframe = PresentationWireframe.shared

    init() {
        view = MainViewController.load(presenter: presenter)

        presenter.view = view
        presenter.wireframe = self

        mainNavigationController = UINavigationController(rootViewController: presentationWireframe.view)
        presentationWireframe.navigationController = mainNavigationController
    }

    func present(in window: UIWindow) {
        window.rootViewController = mainNavigationController
    }

}
