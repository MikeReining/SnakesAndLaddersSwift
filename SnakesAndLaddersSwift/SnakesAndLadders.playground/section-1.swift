// Playground - noun: a place where people can play

import Foundation

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

// Setup default board array with blank squares
var gameBoard = GameBoard(size: 5, difficulty: .Easy)

func squareIsEmpty (itemArray: [Int], putNewItemHere: Int) -> Bool {
    for (index, item) in enumerate(laddersArray) {
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
        var randomSquare = Int(arc4random_uniform(UInt32(gameBoard.board.count)))
        while randomSquare == 0 || randomSquare == gameBoard.board.count || randomSquare == (gameBoard.board.count - 1) || !squareIsEmpty(laddersArray, randomSquare) {
            randomSquare = Int(arc4random_uniform(UInt32(gameBoard.board.count)))
        }
        laddersArray.append(randomSquare)
        
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
        while randomSquare == 0 || randomSquare == gameBoard.board.count || !squareIsEmpty(laddersArray, randomSquare) {
            randomSquare = Int(arc4random_uniform(UInt32(gameBoard.board.count)))
        }
        snakesArray.append(randomSquare)
        
    }
    return snakesArray
}

generateRandomPositionForSnakes(laddersArray)









// Step 2 - Calculate random boost value for snakes
