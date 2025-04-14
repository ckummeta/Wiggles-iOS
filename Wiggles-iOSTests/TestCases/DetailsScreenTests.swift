import XCTest
@testable import Wiggles_iOS

final class DetailsScreenTests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
        
        // Navigate to details page
        let homePage = HomePage(app: app)
        homePage.tapFirstDog()
    }
    
    func testDetailsContent() {
        let detailsPage = DetailsPage(app: app)
        XCTAssertTrue(detailsPage.verifyAllDetailsExist())
    }
    
    func testBackNavigation() {
        let detailsPage = DetailsPage(app: app)
        let homePage = detailsPage.tapBackButton()
        XCTAssertTrue(homePage.verifyHomePageDisplayed())
    }
    
    func testOwnerDetails() {
        let detailsPage = DetailsPage(app: app)
        XCTAssertTrue(detailsPage.verifyOwnerDetailsExist())
    }
}
