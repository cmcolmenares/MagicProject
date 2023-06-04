
import XCTest
@testable import MasterProject

class CardsServiceTests: XCTestCase {

    func testFetchDataSuccess() throws {
        
        // Given
        let mock = CardsServiceMock(responseType: .success)
        
        // When
        mock.getCardsContent(completion: { [weak self] cardsResponse in
            // Then
            XCTAssertNotNil(cardsResponse)
        })
    }
    
    func testFetchDataFailure() throws {
        
        // Given
        let mock = CardsServiceMock(responseType: .failure)
        
        // When
        mock.getCardsContent(completion: { [weak self] cardsResponse in
            // Then
            XCTAssertNil(cardsResponse)
        })
    }
    
    func testLoadModelSuccess() throws {
        
        // Given
        let mock = CardsServiceMock(responseType: .success)
        
        // When
        mock.getCardsContent(completion: { [weak self] cardsResponse in
            if let cardsResponse = cardsResponse {
                let model = CardsTableModel.loadModel(response: cardsResponse)
                // Then
                XCTAssertNotNil(model)
            }
        })
    }
}
