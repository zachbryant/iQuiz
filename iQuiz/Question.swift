//
//  Question.swift
//  iQuiz
//
//  Created by iGuest on 11/4/17.
//  Copyright © 2017 MacroHard. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var answer: Int
    var answers: [String]
    
    init() {
        text = "dummy"
        answer = 0
        answers = ["dummy", "dummy"]
    }
    
    init(_ json: JSON) {
        self.text = json["text"].string!
        self.answer = Int(json["answer"].string!)! - 1
        self.answers = json["answers"].arrayObject as! [String]
    }
}
