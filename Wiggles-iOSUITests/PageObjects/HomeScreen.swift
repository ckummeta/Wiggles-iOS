import XCTest

class HomeScreen {
    private let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    // MARK: - Elements
    var title: XCUIElement {
        app.staticTexts[TestConstants.Accessibility.homeTitle]
    }
    
    var dogList: XCUIElement {
        app.scrollViews[TestConstants.Accessibility.dogListIdentifier]
    }
    
    var firstDogCard: XCUIElement {
        dogList.otherElements.firstMatch
    }
    
    // MARK: - Actions
    func selectFirstDog() {
        firstDogCard.tap()
    }
    
    func scrollToBottom() {
        let startCoordinate = dogList.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5))
        let endCoordinate = dogList.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.9))
        startCoordinate.press(forDuration: 0.1, thenDragTo: endCoordinate)
    }
    
    func verifyHomeScreenElements() throws {
        XCTAssertTrue(title.exists, "Home screen title should exist")
        XCTAssertTrue(dogList.exists, "Dog list should exist")
        XCTAssertTrue(firstDogCard.exists, "At least one dog card should exist")
    }
    
    func getDogName(at index: Int = 0) -> String? {
        let dogCard = dogList.otherElements.element(boundBy: index)
        return dogCard.staticTexts.firstMatch.label
    }
    
    func waitForHomeScreen() -> Bool {
        title.waitForExistence(timeout: TestConstants.defaultTimeout)
    }
}
