import XCTest

class BowlingGame {
    var frames = [Int: [Int]]()
    var currentFrame = 0
    var frameRoll = 1
    var openSpare = false
    var openStrike = false
    
    init() {
        nextFrame()
    }
    
    func roll(pins: Int) {
        
        if(currentFrame == 10) {
            if(frameRoll == 1) {
                checkStrikesOrSpares(pins: pins)
                frames[currentFrame]?.append(pins)
                frameRoll = 2
            } else if(frameRoll == 2) {
                if(frames[currentFrame]?[0] == 10) {
                    frames[currentFrame]?[0] += pins
                    frames[currentFrame]?.append(0)
                } else {
                    frames[currentFrame]?.append(pins)
                }
                frameRoll = 3
            } else {
                frames[currentFrame]?[1] += pins
            }
        } else {
            checkStrikesOrSpares(pins: pins)
            frames[currentFrame]?.append(pins)
            
            if(frameRoll == 1 && pins == 10) {
                openStrike = true
                nextFrame()
            } else if(frames[currentFrame]?.reduce(0) { $0 + $1 } == 10) {
                openSpare = true
                nextFrame()
            } else if(frameRoll == 1) {
                frameRoll = 2
            } else {
                nextFrame()
            }
        }
    }
    
    func nextFrame() {
        currentFrame += 1
        frames[currentFrame] = [Int]()
        frameRoll = 1
    }
    
    func checkStrikesOrSpares(pins: Int) {
        if(openStrike) {
            scoreStrike(pins: pins)
        } else if(openSpare) {
            scoreSpare(pins: pins)
        }
    }
    
    func scoreSpare(pins: Int) {
        frames[currentFrame - 1]?[1] += pins
        openSpare = false
    }
    
    func scoreStrike(pins: Int) {
        if(frameRoll == 1) {
            frames[currentFrame - 1]?[0] += pins
            frames[currentFrame - 1]?.append(pins)
        } else if(frameRoll == 2) {
            frames[currentFrame - 1]?[1] += pins
            openStrike = false
        }
    }
    
    func score() -> Int{
        var score = 0
        
        for key in 1...frames.count {
            score += frames[key]?[0] ?? 0
            score += frames[key]?[1] ?? 0
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
    
    func testGutterGame() {
        for _ in 1...20 {
            game?.roll(pins: 0)
        }
        
        XCTAssertEqual(game?.score(), 0)
    }
    
    func testNoSparesOrStrikes() {
        var count = 0
        for _ in 1...20 {
            let randNum = Int.random(in: 1..<5)
            game?.roll(pins: randNum)
            count += randNum
        }
        
        XCTAssertEqual(game?.score(), count)
    }
    
    func testOneSpare() {
        game?.roll(pins: 6)
        game?.roll(pins: 4)
        game?.roll(pins: 5)
        
        var count = 0
        for _ in 1...17 {
            let randNum = Int.random(in: 1..<5)
            game?.roll(pins: randNum)
            count += randNum
        }
        
        XCTAssertEqual(game?.score(), count + 20)
    }
    
    func testOneStrike() {
        game?.roll(pins: 10)
        game?.roll(pins: 4)
        game?.roll(pins: 3)
        
        var count: Int = 0
        for _ in 1...16 {
            let randNum = Int.random(in: 1..<5)
            game?.roll(pins: randNum)
            count = count + randNum
        }
        
        XCTAssertEqual(game?.score(), count + 28)
    }
    
    func testPerfectGame() {
        for _ in 1...12 {
            game?.roll(pins: 10)
        }
        
        XCTAssertEqual(game?.score(), 300)
    }
}

BowlingGameTests.defaultTestSuite.run()
