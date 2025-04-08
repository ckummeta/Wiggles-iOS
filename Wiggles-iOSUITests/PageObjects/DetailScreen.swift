import XCTest

class DetailScreen {
    private let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    // MARK: - Elements
    var adoptButton: XCUIElement {
        app.buttons[TestConstants.Accessibility.adoptButtonIdentifier]
    }
    
    var backButton: XCUIElement {
        app.buttons[TestConstants.Accessibility.backButtonIdentifier]
    }
    
    var aboutSection: XCUIElement {
        app.staticTexts["About"]
    }
    
    var quickInfoSection: XCUIElement {
        app.staticTexts["Quick Info"]
    }
    
    // MARK: - Actions
    func tapAdoptButton() {
        adoptButton.tap()
    }
    
    func navigateBack() {
        backButton.tap()
    }
    
    func verifyDetailScreenElements() throws {
        XCTAssertTrue(adoptButton.exists, "Adopt button should exist")
        XCTAssertTrue(backButton.exists, "Back button should exist")
        XCTAssertTrue(aboutSection.exists, "About section should exist")
        XCTAssertTrue(quickInfoSection.exists, "Quick Info section should exist")
    }
    
    func waitForDetailScreen() -> Bool {
        adoptButton.waitForExistence(timeout: TestConstants.defaultTimeout)
    }
}
