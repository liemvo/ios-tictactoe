//
//  TictactoePresenter.swift
//  tictactoe
//
//  Created by Liem Vo on 9/1/18.
//  Copyright © 2018 Liem Vo. All rights reserved.
//

import Foundation
class TictactoePresenter: GamePresenter {
    var model: Board?
    var gameView: GameView
    
    init(_ _gameView: GameView) {
        model = Board()
        self.gameView = _gameView
        gameView.restartGame(true, "")
    }
    
    func cellTapped(_ row: Int, _ col: Int) {
        let playerThatMoved = model?.mark(row: row, col: col)
        if playerThatMoved != Player.K {
            gameView.updateCellText(row, col, (playerThatMoved?.rawValue)!)
            if model?.winner != Player.K{
                gameView.updateGameStatus(false, "Winner", (playerThatMoved?.rawValue)!)
            } else if (model?.isFull())! && model?.winner == Player.K {
                gameView.updateGameStatus(false, "Game draws", "")
            }
        }
    }
    
    func reset() {
        model?.restart()
        gameView.restartGame(true, "")
    }
    
    
}
