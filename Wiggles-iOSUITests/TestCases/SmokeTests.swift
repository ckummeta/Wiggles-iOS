import XCTest

class SmokeTests: XCTestCase {
    
    let app = XCUIApplication()
    var homeScreen: HomeScreen!
    var detailScreen: DetailScreen!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
        
        homeScreen = HomeScreen(app: app)
        detailScreen = DetailScreen(app: app)
    }
    
    func testBasicNavigation() throws {
        // Verify home screen loads
        XCTAssertTrue(homeScreen.waitForHomeScreen(), "Home screen should appear")
        try homeScreen.verifyHomeScreenElements()
        
        // Navigate to detail screen
        homeScreen.selectFirstDog()
        XCTAssertTrue(detailScreen.waitForDetailScreen(), "Detail screen should appear")
        try detailScreen.verifyDetailScreenElements()
        
        // Navigate back
        detailScreen.navigateBack()
        XCTAssertTrue(homeScreen.waitForHomeScreen(), "Should return to home screen")
    }
    
    func testAdoptFlow() throws {
        // Navigate to detail screen
        XCTAssertTrue(homeScreen.waitForHomeScreen(), "Home screen should appear")
        homeScreen.selectFirstDog()
        
        // Verify adopt button functionality
        XCTAssertTrue(detailScreen.waitForDetailScreen(), "Detail screen should appear")
        detailScreen.tapAdoptButton()
        
        // Add verification for adoption flow completion
        // Note: Implementation depends on actual app behavior
    }
    
    func testScrollingPerformance() throws {
        XCTAssertTrue(homeScreen.waitForHomeScreen(), "Home screen should appear")
        
        // Test smooth scrolling
        homeScreen.scrollToBottom()
        
        // Capture screenshot for visual verification
        screenshot("After_Scrolling")
    }
}
