//
//  EndGameViewController.swift
//  biased
//
//  Created by Tia King on 12/12/17.
//  Copyright © 2017 hannahmontana. All rights reserved.
//

import UIKit

class EndGameViewController: UIViewController {

    @IBOutlet weak var thanksLabel: UILabel!
    @IBOutlet weak var unbiasedLabel: UILabel!
    @IBOutlet weak var playAgain: UIButton!
    @IBOutlet weak var logOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myColor : UIColor = UIColor.black
        playAgain.layer.borderWidth = 2.0
        playAgain.layer.borderColor = myColor.cgColor
        logOutButton.layer.borderWidth = 2.0
        logOutButton.layer.borderColor = myColor.cgColor
        
        TriviaViewController.counter = 0
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


