import XCTest

extension XCTestCase {
    
    enum TestError: Error {
        case elementNotFound(String)
        case timeout(String)
    }
    
    func wait(for element: XCUIElement, timeout: TimeInterval = 5) -> Bool {
        element.waitForExistence(timeout: timeout)
    }
    
    func waitAndTap(_ element: XCUIElement, timeout: TimeInterval = 5) throws {
        guard wait(for: element, timeout: timeout) else {
            throw TestError.timeout("Element did not appear within \(timeout) seconds")
        }
        element.tap()
    }
    
    func assertExists(_ element: XCUIElement, timeout: TimeInterval = 5) throws {
        guard wait(for: element, timeout: timeout) else {
            throw TestError.elementNotFound("Element not found within \(timeout) seconds")
        }
        XCTAssertTrue(element.exists)
    }
    
    func screenshot(_ name: String) {
        let screenshot = XCUIScreen.main.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = name
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
