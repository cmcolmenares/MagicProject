
import Foundation
import Alamofire

// TODO: - We should create a Builder to create URLs dinamically based on current environment

enum EndpointType {
    case cards
}

struct NetworkingManager {
    
    let baseUrl = NetworkConstantsProvider.baseUrl
    
    func fetchCards(completion: @escaping (CardsResponse?)->()) {
        guard let url = URL(string: buildURL(with: baseUrl, and: .cards)) else {
            print(LocalizedString("invalidURL").resolve())
            completion(nil)
            return
        }
        
        AF.request(url, method: .get).validate().responseData(completionHandler: { data in
                    do {
                        guard let data = data.data else {
                            // TODO: - Error Handler Implementation
                            print("Response Error:", data.error as Any)
                            completion(nil)
                            return
                        }
                        
                        let apiJsonData = try JSONDecoder().decode(CardsResponse.self, from: data)
                        DispatchQueue.main.async {
                            completion(apiJsonData)
                        }
                    } catch {
                        // TODO: - Error Handler Implementation
                        print("ERROR:", error)
                        completion(nil)
                    }
        })
    }
    
    private func buildURL(with base: String, and type: EndpointType) -> String {
        switch type {
        case .cards:
            return base.appending(NetworkConstantsProvider.cardsEndpoint)
        }
    }
}
