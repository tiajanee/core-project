//
//  TrueResultViewController.swift
//  biased
//
//  Created by Tia King on 12/12/17.
//  Copyright © 2017 hannahmontana. All rights reserved.
//

import UIKit

class TrueResultViewController: UIViewController {
    @IBOutlet weak var answerDisplay: UITextView!
   
    @IBOutlet weak var nextQuestion: UIButton!
    @IBOutlet weak var trueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myColor: UIColor = UIColor.white
        nextQuestion.layer.borderColor = myColor.cgColor
        nextQuestion.layer.borderWidth = 2.0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
