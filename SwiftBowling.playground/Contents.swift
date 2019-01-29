import XCTest

class BowlingGame {
    var frames = [Int: [Int]]()
    var currentFrame = 0
    var rolls = 0

    func roll(pins: Int) {
        
        if(rolls % 2 == 0) {
            currentFrame += 1
            frames[currentFrame] = [Int]()
        }
        
        if(currentFrame > 1) {
            maybeScoreSpare(prevFrame: currentFrame - 1, pins: pins)
        }
        
        if(frames[currentFrame]?.count == 0) {
            frames[currentFrame]?.append(pins)
        } else if(frames[currentFrame]?.count == 1) {
            frames[currentFrame]?.append(pins)
        }
        
        rolls += 1
    }
    
    func maybeScoreSpare(prevFrame: Int, pins: Int) {
        if(frames[prevFrame]?.reduce(0) { $0 + $1 } == 10) {
            frames[prevFrame]?[1] += pins
        }
    }

    func score() -> Int{
        var score = 0
        
        for key in 1...10 {
            score += frames[key]?.reduce(0) { $0 + $1 } ?? 0
        }
        
        return score
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

    func testOneSpare() {
        game?.roll(pins: 6)
        game?.roll(pins: 4)
        game?.roll(pins: 7)

        var count: Int = 0
        for _ in 1...17 {
            let randNum = Int.random(in: 1..<5)
            game?.roll(pins: randNum)
            count = count + randNum
        }

        XCTAssertEqual(game?.score(), count + 24)
    }
}

BowlingGameTests.defaultTestSuite.run()
