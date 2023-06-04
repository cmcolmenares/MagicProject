
import Foundation

struct CardsTableItemModel {
    var name: String
    var text: String
    var imageUrl: String?
    
    init(name: String, text: String, imageUrl: String?) {
        self.name = name
        self.text = text
        self.imageUrl = imageUrl
    }
}

class CardsTableModel {
    var items: [CardsTableItemModel] = [CardsTableItemModel]()
    
    init(items: [CardsTableItemModel]) {
        self.items = items
    }
    
    static func loadModel(response: CardsResponse) -> CardsTableModel {
        
        var elements = [CardsTableItemModel]()
        
        response.cards.forEach({ card in
            let item = CardsTableItemModel(name: card.name,
                                           text: card.text,
                                           imageUrl: card.imageUrl)
            elements.append(item)
        })
        
        return CardsTableModel(items: elements)
    }
    
}
