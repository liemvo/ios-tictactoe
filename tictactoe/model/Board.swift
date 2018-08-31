//
//  Board.swift
//  tictactoe
//
//  Created by Liem Vo on 8/31/18.
//  Copyright © 2018 Liem Vo. All rights reserved.
//

import Foundation

let GAME_SIZE = 5
struct Board {
    
    var cells = Array(repeating: Array(repeating: Cell(), count: GAME_SIZE), count: GAME_SIZE)

    var winner: Player?;
    var state: GameState?;
    var currentTurn: Player?;
    
    enum GameState {
        case IN_PROGRESS
        case FINISHED
    }
    
    init() {
        restart()
    }


    mutating func restart() {
        clearCells()
        self.winner = Player.K;
        self.currentTurn = Player.X;
        self.state = GameState.IN_PROGRESS;
    }
    
    mutating func clearCells(){
        for i in 0..<GAME_SIZE {
            for j in 0..<GAME_SIZE{
                cells[i][j] = Cell()
            }
        }
    }
    
    mutating func mark(row: Int, col: Int) {
        if isValid(row: row,col: col) {
            cells[row][col] = Cell(currentTurn!)
            if isWinningMoveByPlayer(currentTurn!, row, col) {
                state = GameState.FINISHED
                winner = currentTurn
            } else {
                flipCurrentTurn()
            }
        }
    }
    
    func isValid(row: Int, col: Int) -> Bool{
        if state == GameState.FINISHED {
            return false
        } else if (isOutOfBounds(idx: row) || isOutOfBounds(idx: col)) {
            return false
        } else if isCellValueAlreadySet(row: row, col: col) {
            return false
        } else {
            return true
        }
    }
    
    func isOutOfBounds( idx: Int) -> Bool{
       return idx < 0 || idx >= GAME_SIZE
    }
    
    func isCellValueAlreadySet(row: Int, col: Int) -> Bool {
        return cells[row][col].value != Player.K
    }
    
    mutating func flipCurrentTurn(){
        self.currentTurn = currentTurn == .X ? .O: .X
    }
    
    func isWinningMoveByPlayer(_ player: Player, _ currentRow: Int, _ currentCol: Int) -> Bool {
        var resultRow = true
        var resultCol = true
        var resultDiagonal = currentRow == currentCol
        var resultOppositeDiagonal = (currentRow + currentCol == GAME_SIZE - 1)
        for i in 0..<GAME_SIZE{
            resultRow = resultRow && (cells[currentRow][i].value == player)
            resultCol = resultCol && (cells[i][currentCol].value == player)
            resultDiagonal = resultDiagonal && (cells[i][i].value == player)
            resultOppositeDiagonal = resultOppositeDiagonal && cells[i][GAME_SIZE - i - 1].value == player
        }
        
        return resultRow || resultCol || resultDiagonal || resultOppositeDiagonal
    }
}
