
import Foundation

final class HomeInteractor: InteractorProtocol {
    
    var wireframe: HomeWireframe?
    var presenter: HomePresenter?
    private let networkingManager = NetworkingManager()
    
    func fetchData(completion: @escaping (CardsTableModel?)->()) {
        networkingManager.fetchCards(completion: { [weak self] cardsResponse in
            guard let cardsResponse = cardsResponse else {
                print(LocalizedString("buildingModelError").resolve())
                completion(nil)
                return
            }
            let model = CardsTableModel.loadModel(response: cardsResponse)
            completion(model)
        })
    }
}
