//
//  tictactoeUITests.swift
//  tictactoeUITests
//
//  Created by Liem Vo on 8/31/18.
//  Copyright © 2018 Liem Vo. All rights reserved.
//

import XCTest

class tictactoeUITests: XCTestCase {
    var board: Board?
    override func setUp() {
        super.setUp()
        board = Board()
        
        continueAfterFailure = false
        XCUIApplication().launch()

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    /*
     * This test will simluate and verify X is a winner
    */
    func testOneRowCrossTopForX() {
        for i in 0..<GAME_SIZE {
            board?.mark(row: 0, col: i)
            if i != (GAME_SIZE - 1) {
                XCTAssertNotEqual(board?.winner, board?.currentTurn)
            }
            else {
                XCTAssertEqual(Player.X, board?.winner)
            }
            let j = i + 1
            if (j < GAME_SIZE) {
                board?.mark(row: j, col: i)
                XCTAssertNotEqual(board?.winner, board?.currentTurn)
            }
        }
    }
    
    /*
     * This test will simulate and verify O is the winner.
     */
    func testGameSizeInRowDiagonalFromTopLeftToBottomForO() {
        board?.mark(row: 0, col: 1)
        XCTAssert(board?.winner != board?.currentTurn)
        for i in 0..<GAME_SIZE {
            board?.mark(row: i, col: i)
            if i != GAME_SIZE - 1 {
                XCTAssertNotEqual(board?.winner, board?.currentTurn)
            } else {
                XCTAssertEqual(board?.winner, Player.O)
            }
            
            let j = i + 1
            if j < GAME_SIZE {
                board?.mark(row: j, col: i)
                XCTAssertNotEqual(board?.winner, board?.currentTurn)
            }
            
        }
    }
    
}
