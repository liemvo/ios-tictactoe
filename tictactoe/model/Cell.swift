//
//  Cell.swift
//  tictactoe
//
//  Created by Liem Vo on 8/31/18.
//  Copyright © 2018 Liem Vo. All rights reserved.
//

import Foundation
struct Cell{
    init(_ _value : Player = Player.K) {
        value = _value
    }
    var value: Player
}
