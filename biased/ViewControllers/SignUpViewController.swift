//
//  File.swift
//  biased
//
//  Created by Tia King on 12/5/17.
//  Copyright © 2017 hannahmontana. All rights reserved.
//


import UIKit

class SignUpViewController: UIViewController {
    

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBAction func submit(_ sender: Any) {
        submit()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
  
    
    
    //posting information to server
    func submit() {
        
        //declare parameter as a dictionary which contains string as key and value combination.

        let userBody = Sign(email: self.email.text!, password: self.password.text!)
        print(userBody)
        
        //        //create the url with NSURL
        let url = NSURL(string: "https://mgd-server.herokuapp.com/user/new")
        //
        //create the session object
        let session = URLSession.shared
        
        //now create the NSMutableRequest object using the url object
        let request = NSMutableURLRequest(url: url! as URL)
        request.httpMethod = "POST" //set http method as POST
        
        do {
            request.httpBody = try JSONEncoder().encode(userBody) // converts body to JSON
            
        } catch let error {
            print(error.localizedDescription)
        }
        
        //HTTP Headers
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request as URLRequest){
            (data, response, error) in
            if error == nil, let responseJSON = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:AnyObject]{
                var user_ID : AnyObject!
                user_ID = responseJSON["_id"]
                print(user_ID)
                let defaults = UserDefaults.standard
                defaults.set(user_ID, forKey:"id")
                
                let id = defaults.object(forKey: "id")
                
        }
        }
        task.resume()
    }
//        let task = session.dataTask(with: request as URLRequest, completionHandler: {(data, response, error) in
//            guard error == nil else {
//                return
//            }
//
//
//        })
//
//        task.resume()
//    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

