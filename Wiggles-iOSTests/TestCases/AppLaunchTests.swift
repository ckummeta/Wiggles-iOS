import XCTest
@testable import Wiggles_iOS

final class AppLaunchTests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
    
    func testAppLaunch() {
        XCTAssertTrue(app.wait(for: .runningForeground, timeout: 5))
        XCTAssertTrue(HomePage.homeTitle.exists)
    }
    
    func testInitialDataLoad() {
        let dogList = HomePage.dogList
        XCTAssertTrue(dogList.exists)
        XCTAssertGreaterThan(dogList.cells.count, 0)
    }
}
