import XCTest

class HomePage {
    private let app: XCUIApplication
    
    static let homeTitle = XCUIApplication().staticTexts["Wiggles"]
    static let dogList = XCUIApplication().scrollViews["DogListScrollView"]
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    func verifyDogListExists() -> Bool {
        return HomePage.dogList.exists
    }
    
    func verifyFirstDogCard() -> Bool {
        let firstDog = HomePage.dogList.cells.firstMatch
        return firstDog.exists
    }
    
    func tapFirstDog() -> DetailsPage {
        let firstDog = HomePage.dogList.cells.firstMatch
        firstDog.tap()
        return DetailsPage(app: app)
    }
    
    func scrollToBottom() -> Bool {
        HomePage.dogList.swipeUp()
        return true
    }
    
    func scrollToTop() -> Bool {
        HomePage.dogList.swipeDown()
        return true
    }
    
    func verifyHomePageDisplayed() -> Bool {
        return HomePage.homeTitle.exists
    }
}
