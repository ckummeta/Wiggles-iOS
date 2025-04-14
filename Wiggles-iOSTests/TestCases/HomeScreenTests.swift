import XCTest
@testable import Wiggles_iOS

final class HomeScreenTests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
    
    func testDogListDisplay() {
        let homePage = HomePage(app: app)
        XCTAssertTrue(homePage.verifyDogListExists())
        XCTAssertTrue(homePage.verifyFirstDogCard())
    }
    
    func testNavigationToDetails() {
        let homePage = HomePage(app: app)
        let detailsPage = homePage.tapFirstDog()
        XCTAssertTrue(detailsPage.verifyDetailsPageDisplayed())
    }
    
    func testScrolling() {
        let homePage = HomePage(app: app)
        XCTAssertTrue(homePage.scrollToBottom())
        XCTAssertTrue(homePage.scrollToTop())
    }
}
