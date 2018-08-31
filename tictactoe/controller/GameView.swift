//
//  GameView.swift
//  tictactoe
//
//  Created by Liem Vo on 9/1/18.
//  Copyright © 2018 Liem Vo. All rights reserved.
//

import Foundation

protocol GameView {
    func restartGame(_ showResult: Bool, _ defaultMessage: String)
    func updateCellText(_ row: Int, _ col: Int, _ text: String)
    func updateGameStatus(_ showResult: Bool, _ gameMessage: String, _ winner: String)
}
