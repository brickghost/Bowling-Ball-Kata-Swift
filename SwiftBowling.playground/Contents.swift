import XCTest

struct BowlingGame {

}

class BowlingGameTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    override func tearDown() {
        super.tearDown()
    }
    
    func testBowlingGame() {
        XCTAssertNotNil(BowlingGame())
    }
}

BowlingGameTests.defaultTestSuite.run()
