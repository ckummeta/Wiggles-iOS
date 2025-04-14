import Foundation
@testable import Wiggles_iOS

struct TestData {
    static let testDog = DogModel(
        id: 999,
        name: "TestDog",
        age: 3,
        gender: "male",
        color: "Brown",
        weight: 15,
        location: "100m",
        image: "test_dog_image",
        about: "Test dog description",
        owner: testOwner
    )
    
    static let testOwner = OwnerModel(
        id: 888,
        name: "Test Owner",
        image: "test_owner_image",
        address: "Test Address",
        about: "Test owner description"
    )
}
