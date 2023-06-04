
import Foundation

final class DetailPresenter: PresenterProtocol {
    var view: DetailViewController!
    var wireframe: DetailWireframe!
    var interactor: Any?
    
    var card: CardsTableItemModel? {
        didSet {
            self.view.hideSpinner()
            view.hideSpinner()
        }
    }
    
    func viewDidLoad() {}
    
    // MARK: - Presenter funcs
    
    func setCard(card: CardsTableItemModel) {
        view.showSpinner()
        self.card = card
    }
}
