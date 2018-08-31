//
//  GamePresenter.swift
//  tictactoe
//
//  Created by Liem Vo on 9/1/18.
//  Copyright © 2018 Liem Vo. All rights reserved.
//

import Foundation

protocol GamePresenter {
    func cellTapped(_ row: Int, _ col: Int)
    func reset()
}
