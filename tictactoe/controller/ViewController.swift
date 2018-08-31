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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onCellTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func reset(_ sender: UIBarButtonItem) {
        resultGroupView.isHidden = true
        playerLabel.text = ""
        resultMessage.text = ""
        button00.titleLabel?.text = ""
        button01.titleLabel?.text = ""
        button02.titleLabel?.text = ""
        button10.titleLabel?.text = ""
        button11.titleLabel?.text = ""
        button12.titleLabel?.text = ""
        button20.titleLabel?.text = ""
        button21.titleLabel?.text = ""
        button22.titleLabel?.text = ""
    }
    
}

