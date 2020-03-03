import XCTest
@testable import ErrorKit

final class ErrorKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ErrorKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
