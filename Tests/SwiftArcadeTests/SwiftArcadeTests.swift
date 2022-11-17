import XCTest
@testable import SwiftArcade

final class SwiftArcadeTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
      
        SwiftArcade.Shared.getConsoleList(UserName: "SaiBalaji", KEY: "aoVI2CTUidbwgyj6v9ARA3cjLj8233jz") { error , consoles  in
            if let consoles{
                print(consoles.first)
            }
        }
        RunLoop.current.run()

    }
}
