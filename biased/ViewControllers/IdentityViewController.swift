//
//  IdentityViewController.swift
//  biased
//
//  Created by Tia King on 12/4/17.
//  Copyright © 2017 hannahmontana. All rights reserved.
//


import UIKit

class IdentityViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    @IBOutlet weak var politicalPicker: UIPickerView!
    @IBOutlet weak var genderPicker: UIPickerView!
    @IBOutlet weak var sexualityPicker: UIPickerView!
    @IBOutlet weak var religionPicker: UIPickerView!
    @IBOutlet weak var racePicker: UIPickerView!
    @IBAction func submitButton(_ sender: Any) {
        submit()
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return politicalChoice.count
        }
        if pickerView.tag == 1 {
            return genderChoice.count
        }
        if pickerView.tag == 2 {
            return sexualityChoice.count
        }
        if pickerView.tag == 3 {
            return religionChoice.count
        }
        if pickerView.tag == 4 {
            return raceChoice.count
        }
        return 0
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        politicalPicker.delegate = self
        politicalPicker.dataSource = self
        
        
        genderPicker.delegate = self
        genderPicker.dataSource = self
        
        sexualityPicker.delegate = self
        sexualityPicker.dataSource = self
        
        religionPicker.delegate = self
        religionPicker.dataSource = self
        
        racePicker.delegate = self
        racePicker.dataSource = self
        
    }
    let politicalChoice = ["Democrat", "Republican", "Green Party", "Independent"]
    let genderChoice = ["Man", "Woman", "Non-Binary"]
    let sexualityChoice = ["Homosexual", "Heterosexual", "Bisexual", "Pansexual","Asexual"]
    let religionChoice = ["Christian", "Atheist", "Catholic", "Muslim", "Agnostic", "Hindu", "Jewish"]
    let raceChoice = ["Black", "White", "Mixed-race", "Asian", "Non-white Hispanic/Latinx", "Native American"]
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView{
       
        print("Returning Custom label")
        var label = view as! UILabel!
        if label == nil {
            label = UILabel()
        }
        if pickerView.tag == 0 {
            label?.font = UIFont(name: "Myanmar Sangam MN", size: 20)!
            label?.text =  politicalChoice[row] as? String
            label?.textAlignment = .center
            label?.layer.borderWidth = 1.0
            return label!
        }
        if pickerView.tag == 1 {
            label?.font = UIFont(name: "Myanmar Sangam MN", size: 20)!
            label?.text =  genderChoice[row] as? String
            label?.textAlignment = .center
            label?.layer.borderWidth = 1.0
            return label!
        }
        
        if pickerView.tag == 2 {
            label?.font = UIFont(name: "Myanmar Sangam MN", size: 20)!
            label?.text =  sexualityChoice[row] as? String
            label?.textAlignment = .center
            label?.layer.borderWidth = 1.0
            return label!
        }
        
        if pickerView.tag == 3 {
            label?.font = UIFont(name: "Myanmar Sangam MN", size: 20)!
            label?.text =  religionChoice[row] as? String
            label?.textAlignment = .center
            label?.layer.borderWidth = 1.0
            return label!
        }
        if pickerView.tag == 4 {
            label?.font = UIFont(name: "Myanmar Sangam MN", size: 20)!
            label?.text =  raceChoice[row] as? String
            label?.textAlignment = .center
            label?.layer.borderWidth = 1.0
            return label!
        }
        return label!
    }
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            if pickerView.tag == 0 {
                return politicalChoice[row]
            }
            if pickerView.tag == 1 {
                return genderChoice[row]
            }
            if pickerView.tag == 2 {
                return sexualityChoice[row]
            }
            if pickerView.tag == 3 {
                return religionChoice[row]
            }
            if pickerView.tag == 4 {
                return raceChoice[row]
            }
            return("oh no")
        }
   
    //posting information to server
        func submit() {
        
        //declare parameter as a dictionary which contains string as key and value combination.
        let labelBody = User(politics: politicalChoice[politicalPicker.selectedRow(inComponent: 0)], gender: genderChoice[genderPicker.selectedRow(inComponent: 0)], sexuality: sexualityChoice[sexualityPicker.selectedRow(inComponent: 0)], religion: religionChoice[religionPicker.selectedRow(inComponent: 0)], race: raceChoice[racePicker.selectedRow(inComponent: 0)])
         print(labelBody)
        
        //create the url with NSURL
        let url = NSURL(string: "https://mgd-server.herokuapp.com/user/id")
        //
                    //create the session object
                    let session = URLSession.shared
        
                    //now create the NSMutableRequest object using the url object
                    let request = NSMutableURLRequest(url: url! as URL)
                    request.httpMethod = "POST" //set http method as POST

                    do {
                        request.httpBody = try JSONEncoder().encode(labelBody) // converts body to JSON

                    } catch let error {
                        print(error.localizedDescription)
                    }

                    //HTTP Headers
                    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                    request.addValue("application/json", forHTTPHeaderField: "Accept")
        
                    //create dataTask using the session object to send data to the server
                    let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
                        print(response)
                        guard error == nil else {
                            return
                        }
                    })
        
                    task.resume()
                }
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    }

//save data to visually show % of people that got questions right or wrong
//what about the UX when no one is playing
//have it so that someone plays for themselves
//putting in graphs for User responses

