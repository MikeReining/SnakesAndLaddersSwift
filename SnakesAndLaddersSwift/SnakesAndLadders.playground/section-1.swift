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

