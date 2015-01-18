// Playground - noun: a place where people can play

import Foundation


enum Square  {
    
    case Empty
    case Snake
    case Ladder
    
    func printDescription() -> String {
        switch self {
        case .Empty:
            return "Empty"
        case .Snake:
            return "Snake"
        case .Ladder:
            return "Ladder"
        }
    }
}

// Setup defaultSquare which should always be blank
var defaultSquare = Square.Empty
defaultSquare.printDescription()


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
    var square: Square
    var board: [Square]
    var difficulty: Difficulty
    init (size: Int, difficulty: Difficulty) {
        self.rows = size
        self.columns = size
        self.square = defaultSquare
        self.difficulty = difficulty
        board = Array(count: rows * columns, repeatedValue: square)
    }
    func startNewGameWithSize(size: Int, withDifficulty: Difficulty) {
        self.rows = size
        self.columns = size
        board = Array(count: rows * columns, repeatedValue: square)
        self.difficulty = withDifficulty
    }
}


// Setup default board array with blank squares
var gameBoard = GameBoard(size: 5, difficulty: .Easy)

gameBoard.startNewGameWithSize(10, withDifficulty: .Medium)





