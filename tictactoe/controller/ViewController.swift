//
//  ViewController.swift
//  tictactoe
//
//  Created by Liem Vo on 8/31/18.
//  Copyright © 2018 Liem Vo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button00: UIButton!
    @IBOutlet weak var button01: UIButton!
    @IBOutlet weak var button02: UIButton!
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button12: UIButton!
    @IBOutlet weak var button20: UIButton!
    @IBOutlet weak var button21: UIButton!
    @IBOutlet weak var button22: UIButton!
    @IBOutlet weak var resultGroupView: UIView!
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var resultMessage: UILabel!
    
    var model: Board?
    override func viewDidLoad() {
        super.viewDidLoad()
        model = Board()
        resetGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onCellTapped(_ sender: UIButton) {
        if !resultGroupView.isHidden{
            return
        }
        let rowTemp = sender.tag%100
        let row = rowTemp/10
        let col = rowTemp%10
        
        let playerThatMoved = model?.mark(row: row, col: col)
        if playerThatMoved != Player.K {
            sender.setTitle(playerThatMoved?.rawValue, for: .normal)
             print("Current button tag \(sender.tag)")
            if model?.winner != Player.K{
                resultGroupView.isHidden = false
                playerLabel.text = playerThatMoved?.rawValue
                resultMessage.text = "Winner"
            } else if (model?.isFull())! && model?.winner == Player.K {
                resultGroupView.isHidden = false
                resultMessage.text = "Game draws"
            }
        }
        
    }
    
    func resetGame() {
        resultGroupView.isHidden = true
        playerLabel.text = ""
        resultMessage.text = ""
        button00.setTitle("", for: .normal)
        button01.setTitle("", for: .normal)
        button02.setTitle("", for: .normal)
        button10.setTitle("", for: .normal)
        button11.setTitle("", for: .normal)
        button12.setTitle("", for: .normal)
        button20.setTitle("", for: .normal)
        button21.setTitle("", for: .normal)
        button22.setTitle("", for: .normal)
        model?.restart()
    }
    
    @IBAction func reset(_ sender: UIBarButtonItem) {
        resetGame()
    }
    
}

