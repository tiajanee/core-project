//
//  QuestionProvider.swift
//  biased
//
//  Created by Tia King on 12/6/17.
//  Copyright © 2017 hannahmontana. All rights reserved.
//

import Foundation
import GameKit

struct QuestionProvider {
    let trivia = [
        ["As of 2015, which"],
        ["Pupusas, handmade thick stuffed corn tortillas, are a traditional dish from what country?", "El Salvador"],
        ["Which of the traditional five senses are dolphins believed not to possess?", "Smell"],
        ["Victoria Beckham was a member of which all girl English pop group formed in 1994?", "The Spice Girls"],
        ["Who was the original singer for the American punk rock band The Misfits?", "Glenn Danzig"],
        ["K-pop is a genre of music that originated in what country?", "South Korea"],
        ["Lambeau Field is the home field of which National Football League team?", "Green Bay Packers"],
        ["What is the most common type of pitch thrown by pitchers in baseball?", "Fastball"],
        ["Barry Bonds currently holds the Major League Baseball home run record with how many home runs?", "762"],
        ["What dish, made from crushed durum wheat, is a staple of western North Africa?", "Couscous"],
        ["Celebrity chef Gordon Ramsay opened his first restaurant in what city?", "London, England"],
        ["Sushi is a type of cuisine that originated in what country?", "Japan"]
]
    func randomQuestion() -> [String] {
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: trivia.count)
        return trivia[randomNumber]
    }
}

