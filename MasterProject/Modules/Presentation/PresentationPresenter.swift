
import Foundation

final class PresentationPresenter: PresenterProtocol {
    var view: PresentationViewController!
    var wireframe: PresentationWireframe!
    var interactor: Any?
    
    func viewDidLoad() {}
    
    // MARK: - Presenter funcs
    
    func navigateToHome() {
        wireframe.navigateToHome()
    }
}
