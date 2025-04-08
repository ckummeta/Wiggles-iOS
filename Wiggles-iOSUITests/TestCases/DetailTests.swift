import XCTest

class DetailTests: XCTestCase {
    
    let app = XCUIApplication()
    var homeScreen: HomeScreen!
    var detailScreen: DetailScreen!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
        
        homeScreen = HomeScreen(app: app)
        detailScreen = DetailScreen(app: app)
        
        // Navigate to detail screen
        XCTAssertTrue(homeScreen.waitForHomeScreen(), "Home screen should appear")
        homeScreen.selectFirstDog()
    }
    
    func testDetailScreenUI() throws {
        XCTAssertTrue(detailScreen.waitForDetailScreen(), "Detail screen should appear")
        
        // Verify all UI elements
        try detailScreen.verifyDetailScreenElements()
        
        screenshot("Detail_Screen_UI")
    }
    
    func testAdoptButtonInteraction() throws {
        XCTAssertTrue(detailScreen.waitForDetailScreen(), "Detail screen should appear")
        
        // Test adopt button
        detailScreen.tapAdoptButton()
        
        // Add verification for adoption flow
        // Note: Implementation depends on actual app behavior
    }
    
    func testBackNavigation() throws {
        XCTAssertTrue(detailScreen.waitForDetailScreen(), "Detail screen should appear")
        
        // Test back navigation
        detailScreen.navigateBack()
        XCTAssertTrue(homeScreen.waitForHomeScreen(), "Should return to home screen")
        
        // Verify we can navigate to details again
        homeScreen.selectFirstDog()
        XCTAssertTrue(detailScreen.waitForDetailScreen(), "Should navigate to detail screen again")
    }
}
