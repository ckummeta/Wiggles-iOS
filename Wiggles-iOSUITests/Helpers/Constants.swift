import Foundation

enum TestConstants {
    static let defaultTimeout: TimeInterval = 5
    
    enum Accessibility {
        static let homeTitle = "Hey Sameer,"
        static let adoptButtonIdentifier = "adoptMeButton"
        static let backButtonIdentifier = "backButton"
        static let dogListIdentifier = "dogList"
    }
    
    enum TestData {
        static let expectedDogName = "Max"
        static let expectedLocation = "2.5 km"
        static let expectedAge = "2 yrs"
    }
}
