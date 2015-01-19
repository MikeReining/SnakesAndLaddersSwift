// Playground - noun: a place where people can play

import Foundation

// MARK: Game model

enum Difficulty {
    
    case Easy
    case Medium
    case Hard
    
    func printDescription() -> String {
        switch self {
        case .Easy:
            return "Easy"
        case .Medium:
            return "Medium"
        case .Hard:
            return "Hard"
        }
    }
}

class GameBoard {
    var rows: Int
    var columns: Int
    var board: [Int]
    var difficulty: Difficulty
    var percentSnakes: Double
    var percentLadders: Double
    init (size: Int, difficulty: Difficulty) {
        self.rows = size
        self.columns = size
        self.difficulty = difficulty
        self.percentLadders = 0.17
        self.percentSnakes = 0.17
        board = Array(count: rows * columns, repeatedValue: 0)
    }
    
    // MARK: Convenience constructor to generate new game
    func startNewGameWithSize(size: Int, withDifficulty: Difficulty) {
        switch withDifficulty {
        case .Easy:
            self.percentLadders = 0.25
            self.percentSnakes = 0.1
        case .Medium:
            self.percentLadders = 0.17
            self.percentSnakes = 0.17
        case .Hard:
            self.percentLadders = 0.1
            self.percentSnakes = 0.25
        default:
            println("Wrong difficulty entered")
        }
        self.rows = size
        self.columns = size
        board = Array(count: rows * columns, repeatedValue: 0)
        self.difficulty = withDifficulty
    }
}

class Player {
    var name: String
    var playerPosition: Int = 0
    var turn: Int = 1
    init(name: String) {
        self.name = name
    }
    
    func randomDiceRoll() -> Int {
        var randomNumber = Int(arc4random() % 6)+1
        return randomNumber
    }
    
    func takeTurnWithDiceRoll() {
        var diceRoll = randomDiceRoll()
        println("\(self.name)'s Turn \(turn): You rolled a \(diceRoll)")
        var playerNewPosition = playerPosition + diceRoll
        if playerNewPosition >= gameBoard.board.count {
            println("CONGRATULATIONS \(self.name) is the winner!")
        } else {
            var movePlayerTo = playerPosition + diceRoll
            var bumpAtNewPosition = gameBoard.board[movePlayerTo]
            var playerPositionAtEndOfTurn = movePlayerTo + bumpAtNewPosition

            if bumpAtNewPosition > 0 {
                println("SUPER! Your found a ladder and got bumped up \(bumpAtNewPosition) spots to position \(playerPositionAtEndOfTurn)!")
            } else if bumpAtNewPosition < 0 {
                println("OH NO! Your found a snake and got bumped back \(bumpAtNewPosition) spots to position \(playerPositionAtEndOfTurn)!")
            } else {
                println("You are now at position: \(playerPositionAtEndOfTurn)")
            }
            playerPosition = playerPositionAtEndOfTurn
            turn += 1
        }
    }
}

// MARK: Functions to generate random game board

// Setup default board array with blank squares
var gameBoard = GameBoard(size: 5, difficulty: .Easy)

// While placing snakes and ladders, always make sure the square is still empty.  If not, generate a new random number
var gameBoardWithItems = [Int]()

func squareIsEmpty (gameBoardWithItems: [Int], putNewItemHere: Int) -> Bool {
    for (index, item) in enumerate(gameBoardWithItems) {
        if item == putNewItemHere {
            return false
        }
    }
    return true
}


// Step 1 - Put ladders in random positions in grid
func generateRandomPositionForLadders() -> [Int] {
    var laddersCount = Int(Double(gameBoard.board.count) * gameBoard.percentLadders)
    var laddersArray = [Int]()
    for ladder in 1...laddersCount {
        var randomSquare = Int(arc4random_uniform(UInt32((gameBoard.board.count - 1))))
        while randomSquare == 0 || randomSquare == gameBoard.board.count || !squareIsEmpty(gameBoardWithItems, randomSquare) {
            randomSquare = Int(arc4random_uniform(UInt32(gameBoard.board.count)))
        }
        laddersArray.append(randomSquare)
        gameBoardWithItems.append(randomSquare)
        
    }
    return laddersArray
}

let laddersArray = generateRandomPositionForLadders()

// Step 2 - put snakes in random position in grid

func generateRandomPositionForSnakes(laddersArray: [Int]) -> [Int] {
    var snakesCount = Int(Double(gameBoard.board.count) * gameBoard.percentSnakes)
    var snakesArray = [Int]()
    for snake in 1...snakesCount {
        var randomSquare = Int(arc4random_uniform(UInt32(gameBoard.board.count)))
        while randomSquare == 0 || randomSquare == gameBoard.board.count || !squareIsEmpty(gameBoardWithItems, randomSquare) {
            randomSquare = Int(arc4random_uniform(UInt32(gameBoard.board.count)))
        }
        snakesArray.append(randomSquare)
        gameBoardWithItems.append(randomSquare)
    }
    return snakesArray
}


let snakesArray = generateRandomPositionForSnakes(laddersArray)

// Step 2 - update game board with random bumps for snakes and ladders
gameBoardWithItems

for ladder in laddersArray {
    var distanceToFinish = gameBoard.board.count - ladder
    var randomLadderBump = Int((Float(Int(arc4random_uniform(UInt32(40))) + 20) / 100) * Float(distanceToFinish))
    gameBoard.board[ladder] = randomLadderBump
}


for snake in snakesArray {
    var distanceFromStart = snake
    var randomSnakeBump = Int((Float(Int(arc4random_uniform(UInt32(40))) + 20) / 100) * Float(distanceFromStart))
    randomSnakeBump = randomSnakeBump - randomSnakeBump - randomSnakeBump
    gameBoard.board[snake] = randomSnakeBump
    gameBoardWithItems.append(randomSnakeBump)
}

// Start Playing Game

var player1 = Player(name: "Mike")
var player2 = Player(name: "Sonja")

// Take Turns until one person wins!

player1.takeTurnWithDiceRoll()
player2.takeTurnWithDiceRoll()
player1.takeTurnWithDiceRoll()
player2.takeTurnWithDiceRoll()
player1.takeTurnWithDiceRoll()
player2.takeTurnWithDiceRoll()
player1.takeTurnWithDiceRoll()
player2.takeTurnWithDiceRoll()
player1.takeTurnWithDiceRoll()
player2.takeTurnWithDiceRoll()
player1.takeTurnWithDiceRoll()
player2.takeTurnWithDiceRoll()
player1.takeTurnWithDiceRoll()
player2.takeTurnWithDiceRoll()
player1.takeTurnWithDiceRoll()
player2.takeTurnWithDiceRoll()
player1.takeTurnWithDiceRoll()
player2.takeTurnWithDiceRoll()
player1.takeTurnWithDiceRoll()
player2.takeTurnWithDiceRoll()












