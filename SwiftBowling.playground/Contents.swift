import XCTest

class BowlingGame {
    var frames = [Int: [Int]]()

    func roll(pins: Int) {
        
    }

    func score() -> Int{
        return 0
    }
}

class BowlingGameTests: XCTestCase {
    var game: BowlingGame?
    
    override func setUp() {
        game = BowlingGame()
        super.setUp()
    }
    override func tearDown() {
        super.tearDown()
    }
    
    func testBowlingGame() {
        XCTAssertNotNil(game)
    }

    func testGutterGame() {
        for _ in 1...20 {
            game?.roll(pins: 0)
        }

        XCTAssertEqual(game?.score(), 0)
    }
}

BowlingGameTests.defaultTestSuite.run()
