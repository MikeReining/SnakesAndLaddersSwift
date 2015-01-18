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
    init (size: Int, difficulty: Difficulty) {
        self.rows = size
        self.columns = size
        self.difficulty = difficulty
        board = Array(count: rows * columns, repeatedValue: 0)
    }
    func startNewGameWithSize(size: Int, withDifficulty: Difficulty) {
        self.rows = size
        self.columns = size
        board = Array(count: rows * columns, repeatedValue: 0)
        self.difficulty = withDifficulty
    }
}


// Setup default board array with blank squares
var gameBoard = GameBoard(size: 5, difficulty: .Easy)

gameBoard.startNewGameWithSize(10, withDifficulty: .Medium)



