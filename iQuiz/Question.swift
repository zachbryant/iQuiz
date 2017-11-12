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
    var answerIndex: Int
    var answers: [String]
    
    init() {
        text = "question test"
        answers = ["The quick brown fox jumps over the lazy dog.The quick brown fox jumps over the lazy dog.", "a2 test", "a3 test", "a4 test"]
        answerIndex = Int(arc4random_uniform(UInt32(answers.count)))
    }
    
    init(text: String, answerIndex: Int, answers: String...) {
        self.text = text
        self.answerIndex = answerIndex
        self.answers = answers
    }
}
