//
//  QuizDataSource.swift
//  iQuiz
//
//  Created by iGuest on 11/4/17.
//  Copyright © 2017 MacroHard. All rights reserved.
//

import Foundation

class QuizDataSource {
    
    init() {
    }
    
    func getData() -> [Quiz] {
        return [getQuiz("Mathematics"),
                getQuiz("Marvel Super Heroes"),
                getQuiz("Science")]
    }
    
    fileprivate func getQuiz(_ topic: String) -> Quiz {
        return Quiz(subject: topic, desc: "Set in QDS.getQuiz()", icon: "atomicmodel.png", questions: [Question(), Question(), Question(), Question()])
    }
}
