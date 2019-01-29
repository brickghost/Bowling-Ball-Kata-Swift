import XCTest

class BowlingGame {
    var rolls = [Int]()
    var currentFrame = 1

    func roll(pins: Int) {
        rolls.append(pins)
    }

    func score() -> Int{
        return rolls.reduce(0, +)
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
    
    func testNoSparesOrStrikes() {
        var count: Int = 0
        for _ in 1...20 {
            let randNum = Int.random(in: 1..<5)
            game?.roll(pins: randNum)
            count = count + randNum
        }
        
        XCTAssertEqual(game?.score(), count)
    }
}

BowlingGameTests.defaultTestSuite.run()
