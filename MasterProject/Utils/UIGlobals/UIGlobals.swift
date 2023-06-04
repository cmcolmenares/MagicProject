
import UIKit

// MARK: - UIGLobals
struct UIGlobals {}

// MARK: - UIGlobalUser
struct UIGlobalUser {
    static let user = "Carlos Manuel Colmenares Zurita"
    static let email = "carlosmcolmenaresz@gmail.com"
    static let date = "4/06/2023"
}

// MARK: - NetworkConstantsProvider
struct NetworkConstantsProvider {
    /// this struct can be improved by implementing a function that retrieves baseUrl based on enviroment
    static let baseUrl = "https://api.magicthegathering.io/"
    static let cardsEndpoint = "v1/cards"
}
