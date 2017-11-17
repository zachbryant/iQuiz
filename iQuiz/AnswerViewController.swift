//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by iGuest on 11/10/17.
//  Copyright © 2017 MacroHard. All rights reserved.
//

import Foundation
import UIKit

class AnswerViewController: UIViewController {
    @IBOutlet weak var navbar: UINavigationBar!
    var questionIndex: Int = 0
    var questions: [Question] = []
    var quiz: Quiz = Quiz()
    @IBOutlet weak var qLabel: UILabel!
    @IBOutlet weak var finishButton: UIButton!
    @IBOutlet weak var a4: UILabel!
    @IBOutlet weak var a3: UILabel!
    @IBOutlet weak var a2: UILabel!
    @IBOutlet weak var a1: UILabel!
    weak var lastClicked: UILabel!
    weak var correctLabel: UILabel!
    var wrongColor: CGColor = UIColor(red: CGFloat(244.0/255.0), green: CGFloat(67.0/255.0), blue: CGFloat(54.0/255.0), alpha: CGFloat(0.3)).cgColor
    var correctColor: CGColor = UIColor(red: CGFloat(54.0/255.0), green: CGFloat(244.0/255.0), blue: CGFloat(67.0/255.0), alpha: CGFloat(0.3)).cgColor
    
    var finish: Bool = false
    var wrongCount: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        switch question.answer {
            case 0:
                a1.layer.backgroundColor = correctColor
                correctLabel = a1
            case 1:
                a2.layer.backgroundColor = correctColor
                correctLabel = a2
            case 2:
                a3.layer.backgroundColor = correctColor
                correctLabel = a3
            case 3:
                a4.layer.backgroundColor = correctColor
                correctLabel = a4
            default:
                NSLog("bad index!")
        }
        switch Int(lastClicked.accessibilityIdentifier!)! {
            case 0:
                lastClicked = a1
            case 1:
                lastClicked = a2
            case 2:
                lastClicked = a3
            case 3:
                lastClicked = a4
            default:
                NSLog("bad index!")
        }
        if correctLabel != lastClicked {
            lastClicked.layer.backgroundColor = wrongColor
            lastClicked.text = "Wrong!  " + lastClicked.text!
            wrongCount = wrongCount + 1
        }
        else {
            correctLabel.text = "Correct!  " + correctLabel.text!
        }
        
        if questionIndex >= questions.count - 1 {
            finish = true
            finishButton.setTitle("Finish", for: UIControlState.normal)
        }
    }
    
    func setLabelAttrs(_ label: UILabel) {
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.left
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
            case "cancelasegue":
                NSLog("canceling")
            case "finishsegue":
                let fvc = segue.destination as! FinishViewController
                fvc.wrongCount = self.wrongCount
                fvc.questionCount = questions.count
            case "questionsegue":
                let qvc = segue.destination as! QuestionViewController
                qvc.quiz = self.quiz
                qvc.wrongCount = self.wrongCount
                qvc.questionIndex = self.questionIndex + 1
            default: NSLog("bad identifier: " + segue.identifier!)
        }
    }
    @IBAction func finishClick(_ sender: UIButton) {
        if finish {
            performSegue(withIdentifier: "finishsegue", sender: self)
        }
        else {
            performSegue(withIdentifier: "questionsegue", sender: self)
        }
    }
    
}
