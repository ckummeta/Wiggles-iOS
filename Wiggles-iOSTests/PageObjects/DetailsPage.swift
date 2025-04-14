import XCTest

class DetailsPage {
    private let app: XCUIApplication
    
    private let backButton: XCUIElement
    private let dogNameLabel: XCUIElement
    private let dogAgeLabel: XCUIElement
    private let dogLocationLabel: XCUIElement
    private let ownerNameLabel: XCUIElement
    
    init(app: XCUIApplication) {
        self.app = app
        self.backButton = app.buttons["BackButton"]
        self.dogNameLabel = app.staticTexts["DogNameLabel"]
        self.dogAgeLabel = app.staticTexts["DogAgeLabel"]
        self.dogLocationLabel = app.staticTexts["DogLocationLabel"]
        self.ownerNameLabel = app.staticTexts["OwnerNameLabel"]
    }
    
    func verifyDetailsPageDisplayed() -> Bool {
        return dogNameLabel.exists
    }
    
    func verifyAllDetailsExist() -> Bool {
        return dogNameLabel.exists &&
               dogAgeLabel.exists &&
               dogLocationLabel.exists
    }
    
    func verifyOwnerDetailsExist() -> Bool {
        return ownerNameLabel.exists
    }
    
    func tapBackButton() -> HomePage {
        backButton.tap()
        return HomePage(app: app)
    }
}
