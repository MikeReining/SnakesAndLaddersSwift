// Playground - noun: a place where people can play

import Foundation


enum Square: String {
    
    case Empty = "-"
    case Snake = "S"
    case Ladder = "L"
    
    var description: String {
        get {
            switch self {
            case .Empty:
                return "Empty\n"
            case .Snake:
                return "Treasure\n"
            case .Ladder:
                return "Ladder\n"
            }
        }
    }
}

// Setup defaultSquare which should always be blank
var defaultSquare = Square(rawValue: "-")

enum Difficulty: String {
    
    case Easy = "-"
    case Medium = "S"
    case Hard = "L"
    
    var description: String {
        get {
            switch self {
            case .Easy:
                return "Easy\n"
            case .Medium:
                return "Medium\n"
            case .Hard:
                return "Hard\n"
            }
        }
    }
}


class GameBoard {
    var rows: Int
    var columns: Int
    var square: Square
    var board: [Square]
    init (size: Int) {
        self.rows = size
        self.columns = size
        self.square = defaultSquare!
        board = Array(count: rows * columns, repeatedValue: square)
    }
}


// Setup default board array with blank squares
var gameBoard = GameBoard(size: 5)


