//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by iGuest on 11/10/17.
//  Copyright © 2017 MacroHard. All rights reserved.
//

import Foundation
import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet weak var navbar: UINavigationBar!
    var questionIndex: Int = 0
    var questions: [Question] = []
    var quiz: Quiz = Quiz(subject: "dummy", desc: "dummy", icon: "dummy", questions: [])
    @IBOutlet weak var qLabel: UILabel!
    @IBOutlet weak var submit: UIButton!
    @IBOutlet weak var a4: UILabel!
    @IBOutlet weak var a3: UILabel!
    @IBOutlet weak var a2: UILabel!
    @IBOutlet weak var a1: UILabel!
    weak var lastClicked: UILabel!
    var wrongCount: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog(quiz.getSubject()!)
        navbar.topItem?.title = quiz.getSubject()
        questions = quiz.getQuestions()
        var question = questions[questionIndex]
        qLabel.text = question.text
        setLabelAttrs(a1)
        setLabelAttrs(a2)
        setLabelAttrs(a3)
        setLabelAttrs(a4)
        a1.text = question.answers[0]
        a2.text = question.answers[1]
        a3.text = question.answers[2]
        a4.text = question.answers[3]
        submit.isEnabled = false
    }
    
    @objc func clickAns(gestureRecognizer: UIGestureRecognizer) {
        if lastClicked != nil {
            lastClicked.layer.backgroundColor = nil
        }
        lastClicked = gestureRecognizer.view as! UILabel
        lastClicked.layer.backgroundColor = UIColor(red: CGFloat(100.0/255.0), green: CGFloat(181.0/255.0), blue: CGFloat(246.0/255.0), alpha: CGFloat(0.3)).cgColor
        submit.isEnabled = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
            case "anssegue":
                let avc = segue.destination as! AnswerViewController
                avc.quiz = self.quiz
                avc.questions = self.questions
                avc.questionIndex = self.questionIndex
                avc.lastClicked = self.lastClicked
                avc.wrongCount = self.wrongCount
            case "cancelqsegue":
                NSLog("canceling")
            default: NSLog("Bad identifier: " + segue.identifier!)
        }
    }
    
    func setLabelAttrs(_ label: UILabel) {
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(clickAns))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(gestureRecognizer)
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.left
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
    }
    
}
