//
//  ViewController.swift
//  biased
//
//  Created by Tia King on 12/4/17.
//  Copyright © 2017 hannahmontana. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    @IBOutlet weak var orangeBorder: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var whiteBorder: UIImageView!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myColor : UIColor = UIColor.white
        emailText.layer.borderColor = myColor.cgColor
        passwordText.layer.borderColor = myColor.cgColor
        

//        // Do any additional setup after loading the view, typically from a nib.
     }
//    func login(){
//        let session = URLSession.shared // .shared means i'm allowing it to be used for multiple network requests
//        let getRequest = URLRequest(url: URL(string: "https://mgd-server.herokuapp.com/user/\(id)")!) //!: if url does not exist, it will crash during unwrapping
//        session.dataTask(with: getRequest, completionHandler: { (data, resp, err) in  //dataTask: complete this task and return with data
//            if let data = data {
//                let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) //.allowFragments means specifies that the parser should allow
//                //segue into view controller
//
//                }
//                //top-level objects that are not an instance of NSArray or NSDictionary
//                print(json)
//            }
//        }).resume()
//
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//
}

