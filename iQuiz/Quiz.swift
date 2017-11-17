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
    fileprivate var title: String
    fileprivate var desc: String
    fileprivate var icon: String
    
    init() {
        title = "dummy"
        desc = "dummy"
        icon = "dummy"
        questions = [Question()]
    }
    
    init(_ json: JSON) {
        let qArr = json["questions"]
        self.questions = []
        for i in 0..<qArr.count {
            questions.append(Question(qArr[i]))
        }
        self.title = json["title"].string!
        self.desc = json["desc"].string!
        self.icon = "atomicmodel"
    }
    
    func getQuestions() -> [Question] {
        return questions
    }
    
    func getSubject() -> String {
        return title
    }
    
    func getDescription() -> String {
        return desc
    }
    
    func getIcon() -> String {
        return icon
    }
}
