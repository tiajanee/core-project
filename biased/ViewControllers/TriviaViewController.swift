//
//  TriviaViewController.swift
//  biased
//
//  Created by Tia King on 12/6/17.
//  Copyright © 2017 hannahmontana. All rights reserved.
//

import UIKit


class TriviaViewController: UIViewController {
    
    @IBOutlet weak var questionDisplay: UITextView!
    @IBOutlet weak var falseChoice: UIButton!
    @IBOutlet weak var trueChoice: UIButton!
    var answerToPass: Bool!
    static var counter: Int = 0
    
    
    @IBAction func trueButtonTapped(_ sender: Any) {
        print(answerToPass)
        if answerToPass {
            self.performSegue(withIdentifier: "toTrueVC", sender: self)
        } else {
            self.performSegue(withIdentifier: "toFalseVC", sender: self)
        }
        
    }

    @IBAction func falseButtonTapped(_ sender: Any) {
        if answerToPass {
            self.performSegue(withIdentifier: "toFalseVC", sender: self)
        } else {
            self.performSegue(withIdentifier: "toTrueVC", sender: self)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        print(TriviaViewController.counter)
        if TriviaViewController.counter > 10 {
            let storyboard = self.storyboard
            let VC = storyboard?.instantiateViewController(withIdentifier: "endGameVC") as! EndGameViewController
            present(VC, animated: true, completion: {
                print("done")
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myColor : UIColor = UIColor.black
        falseChoice.layer.borderColor = myColor.cgColor
        trueChoice.layer.borderColor = myColor.cgColor
        falseChoice.layer.borderWidth = 2.5
        trueChoice.layer.borderWidth = 2.5
        
        func getQuestion(completion: @escaping (Error?) -> Void) {
            
            var request = URLRequest(url: URL(string: "https://mgd-server.herokuapp.com/trivia/random")!)

            request.httpMethod = "GET"
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {                                                 // check for fundamental networking error
                    print("error=\(String(describing: error))")
                    return
                }
           
                let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
                print(json)
                if let question = json!["question"] as? String {
                    DispatchQueue.main.async {
                        let responseString = String(data: data, encoding: .utf8)
                        print("responseString = \(String(describing: responseString))")
                        self.questionDisplay.text = question
                        print(question)
                    }
                    }
                if let answer = json!["answer"] as? Bool {
                    self.answerToPass = answer
                  
                }
               
            }
            task.resume()

            // Something that takes some time to complete.
            completion(nil) // Or completion(SomeError.veryBadError)

        }
        
        getQuestion { error in
            if let error = error {
                print("Oops! Something went wrong...")
            } else {
                print("Here")
            }
        }
        
        
        questionDisplay.textAlignment = .center
    
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        TriviaViewController.counter += 1
        if let identifer = segue.identifier {
            if identifer == "toTrueVC" {
                if self.answerToPass {
                    let TrueVC = segue.destination as! TrueResultViewController
                } else {
                    
                }
                
            }
            if let identifier = segue.identifier {
                if identifier == "toFalseVC" {
                    if self.answerToPass  {
                        let FalseVC = segue.destination as! FalseResultViewController
                        //FalseVC.answerDisplay.text = answer
                        
                    }
                }
        }
    }
    }
}
