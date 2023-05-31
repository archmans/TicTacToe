//
//  GameState.swift
//  TicTacToe
//
//  Created by Muhamad Salman Hakim Alfarisi on 31/05/23.
//

import Foundation

class GameState: ObservableObject {
    @Published var board = [[Cell]]()
    @Published var turn = Tile.Cross
    @Published var crossScore = 0
    @Published var noughtScore = 0
    @Published var showAlert = false
    @Published var alertMessage = "Draw"
    
    init()
    {
        resetBoard()
    }
    
    func turnText() -> String {
        return turn == Tile.Cross ? "Turn: Cross" : "Turn: Nought"
    }
    
    func resetBoard() {
        var newBoard = [[Cell]]()
        
        for _ in 0...2 {
            var row = [Cell]()
            for _ in 0...2 {
                row.append(Cell(tile: Tile.Empty))
            }
            newBoard.append(row)
        }
        
        board = newBoard
    }
    
    func placeTile(_ row: Int, _ col: Int) {
        if (board[row][col].tile != Tile.Empty) {
            return
        }
        
        board[row][col].tile = turn == Tile.Cross ? Tile.Cross : Tile.Nought
        // update turn
        if (checkWinner()) {
            if (turn == Tile.Cross) {
                crossScore += 1
            } else {
                noughtScore += 1
            }
            
            let winner = turn == Tile.Cross ? "Cross" : "Noughts"
            alertMessage = winner + " Win! 🏆"
            showAlert = true
        } else {
            turn = turn == Tile.Cross ? Tile.Nought : Tile.Cross
        }
        if (checkDraw()) {
            alertMessage = "Draw"
            showAlert = true
        }
    }
    
    func isTurnTile(_ row: Int, _ col: Int) -> Bool {
        return board[row][col].tile == turn
    }
    
    func checkWinner() -> Bool {
        // check rows and cols using loops and the `isTurnTile` function
        // check verticals and horizontals
        for i in 0...2 {
            if (isTurnTile(i, 0) && isTurnTile(i, 1) && isTurnTile(i, 2)) {
                return true
            }
            
            if (isTurnTile(0, i) && isTurnTile(1, i) && isTurnTile(2, i)) {
                return true
            }
        }

        // check diagonals
        if (isTurnTile(0, 0) && isTurnTile(1, 1) && isTurnTile(2, 2)) {
            return true
        }
        if (isTurnTile(0, 2) && isTurnTile(1, 1) && isTurnTile(2, 0)) {
            return true
        }
        return false
    }
    
    func checkDraw() -> Bool {
        for row in board {
            for col in row {
                if (col.tile == Tile.Empty) {
                    return false
                }
            }
        }
        return true
    }
}
