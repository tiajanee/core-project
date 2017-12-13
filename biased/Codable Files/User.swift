//
//  User.swift
//  biased
//
//  Created by Tia King on 12/4/17.
//  Copyright © 2017 hannahmontana. All rights reserved.
//

import Foundation
struct User:Codable {
    let politics: String
    let gender: String
    let sexuality: String
    let religion: String
    let race: String
    
}
struct LogIn:Codable {
    let email: String
    let password: String
}



