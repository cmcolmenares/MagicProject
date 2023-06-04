
import Foundation

struct CardsResponse: Codable {
    let cards: [Card]
}

struct Card: Codable {
    let name: String
    let imageUrl: String?
    let text: String
}
