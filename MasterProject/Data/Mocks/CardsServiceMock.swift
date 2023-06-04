
import Foundation

class CardsServiceMock {
    
    // MARK: - Properties
    
    enum ResponseType {
        case success
        case failure
        case auth
    }
    
    private var responseType: ResponseType
    
    // MARK: - Initializers
    
    init(responseType: ResponseType = .success) {
        self.responseType = responseType
    }
    
    // MARK: - ApiService
    
    func getCardsContent(completion: @escaping (CardsResponse?)->()) {
        switch responseType {
        case .success:
            let response: CardsResponse = loadJSONFrom("CardsJSON.json")
            completion(response)
        default:
            completion(nil)
        }
    }
}
