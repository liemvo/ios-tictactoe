//
//  ViewController.swift
//  tictactoe
//
//  Created by Liem Vo on 8/31/18.
//  Copyright © 2018 Liem Vo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, GameView{
    
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
    
    var presenter: GamePresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = TictactoePresenter(self)
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
        presenter?.cellTapped(row, col)
        
    }
    
    @IBAction func resetTapped(_ sender: UIBarButtonItem) {
        presenter?.reset()
    }
    
    func restartGame(_ showResult: Bool, _ defaultMessage: String) {
        resultGroupView.isHidden = showResult
        playerLabel.text = defaultMessage
        resultMessage.text = defaultMessage
        button00.setTitle(defaultMessage, for: .normal)
        button01.setTitle(defaultMessage, for: .normal)
        button02.setTitle(defaultMessage, for: .normal)
        button10.setTitle(defaultMessage, for: .normal)
        button11.setTitle(defaultMessage, for: .normal)
        button12.setTitle(defaultMessage, for: .normal)
        button20.setTitle(defaultMessage, for: .normal)
        button21.setTitle(defaultMessage, for: .normal)
        button22.setTitle(defaultMessage, for: .normal)
    }
    
    func updateCellText(_ row: Int, _ col: Int, _ text: String) {
        let tag = 100 + row*10 + col
        if let cellButton = self.view.viewWithTag(tag) as! UIButton? {
            cellButton.setTitle(text, for: .normal)
        }
    }
    
    func updateGameStatus(_ showResult: Bool, _ gameMessage: String, _ winner: String) {
        resultGroupView.isHidden = showResult
        resultMessage.text = gameMessage
        playerLabel.text = winner
    }
    
}

