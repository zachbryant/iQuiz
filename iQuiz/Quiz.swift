//
//  Quiz.swift
//  iQuiz
//
//  Created by iGuest on 11/4/17.
//  Copyright © 2017 MacroHard. All rights reserved.
//

import Foundation

struct Quiz {
    fileprivate var questions: [Question]
    fileprivate var subject: String? = nil
    fileprivate var desc: String? = nil
    fileprivate var icon: String? = nil
    
    init(subject: String, desc: String, icon: String, questions: [Question]) {
        self.subject = subject
        self.desc = desc
        self.icon = icon
        self.questions = questions
    }
    
    func getQuestions() -> [Question] {
        return questions
    }
    
    func getSubject() -> String? {
        return subject
    }
    
    func getDescription() -> String? {
        return desc
    }
    
    func getIcon() -> String? {
        return icon
    }
}
