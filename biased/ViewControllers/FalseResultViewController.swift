//
//  ResultViewController.swift
//  biased
//
//  Created by Tia King on 12/6/17.
//  Copyright © 2017 hannahmontana. All rights reserved.
//

import UIKit

class FalseResultViewController: UIViewController {

    @IBOutlet weak var answerDisplay: UITextView!
    
    @IBOutlet weak var backgroundColor: UIImageView!
    @IBOutlet weak var answerTextView: UITextView!
    @IBOutlet weak var wrongNotif: UILabel!
    @IBOutlet weak var nextQuestion: UIButton!
    
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

