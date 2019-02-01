## Uncle Bob's Bowling Game Kata in Swift
Visit the original [here](http://butunclebob.com/ArticleS.UncleBob.TheBowlingGameKata)

### Branch off of master to begin your own implementation
My first down and dirty pass at this can be found on branch [brick_01](https://github.com/brickghost/SwiftBowlingKata/tree/brick_01)

Feel free to clone and branch your own attempt(s) and submit pull requests, I look forward to seeing other approaches.

As I first attempted this kata thinking only of the basic rules below, I quickly realized I would have benefited greatly from better understanding scoring in real bowling and wished I had thought of an actual score card and the symbols used. Learn more on that [here](http://slocums.homestead.com/gamescore.html). However, I forged ahead and have no regrets. I feel it will make my further attemps even more useful for my learning.

### Requirements
**Write a class named “Game” that has two methods**
* roll(pins : int) is called each time the player rolls a ball.  The argument is the number of pins knocked down.
* score() : int is called only at the very end of the game.  It returns the total score for that game.

**Test Drive your implementation [(TDD)](https://en.wikipedia.org/wiki/Test-driven_development) with the following 5 test**
* Test a game of gutters balls, i.e. all zeros.
* Test a game with no strikes or spares. Some call this "All ones rolled".
* Test a game with at least one spare.
* Test a game with at least one strike.
* Test a perfect game, i.e. all strikes.
