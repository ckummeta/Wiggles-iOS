import XCTest

class HomeTests: XCTestCase {
    
    let app = XCUIApplication()
    var homeScreen: HomeScreen!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
        homeScreen = HomeScreen(app: app)
    }
    
    func testHomeScreenUI() throws {
        XCTAssertTrue(homeScreen.waitForHomeScreen(), "Home screen should appear")
        
        // Verify main UI elements
        try homeScreen.verifyHomeScreenElements()
        
        // Verify first dog card data
        if let dogName = homeScreen.getDogName() {
            XCTAssertFalse(dogName.isEmpty, "Dog name should not be empty")
        }
        
        screenshot("Home_Screen_UI")
    }
    
    func testDogListInteraction() throws {
        XCTAssertTrue(homeScreen.waitForHomeScreen(), "Home screen should appear")
        
        // Test scrolling
        homeScreen.scrollToBottom()
        
        // Scroll back to top (implementation needed)
        // Verify we can still see the first dog
        XCTAssertTrue(homeScreen.firstDogCard.exists, "Should be able to scroll back to first dog")
    }
}
