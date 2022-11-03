import XCTest
@testable import SwiftArcade

final class SwiftArcadeTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
      
        SwiftArcade.Shared.getConsoleList(UserName: "SaiBalaji", KEY: "aoVI2CTUidbwgyj6v9ARA3cjLj8233jz") { error, console in
            if let error{
                print(error)
            }
            if let console{
                
                print(console.first?.Name)
            }
        }
        RunLoop.current.run()

    }
}
