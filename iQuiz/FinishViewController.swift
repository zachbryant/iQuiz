//
//  FinishViewController.swift
//  iQuiz
//
//  Created by iGuest on 11/11/17.
//  Copyright © 2017 MacroHard. All rights reserved.
//

import Foundation
import UIKit

class FinishViewController: UIViewController {
    @IBOutlet weak var navMenuButton: UIBarButtonItem!
    @IBOutlet weak var navbar: UINavigationBar!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    var wrongCount: Int = 0
    var questionCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let pct: Double = Double(questionCount - wrongCount) / Double(questionCount)
        var result: String = ""
        if pct == 1.0 {
            result = "Perfect! You got all " + String(questionCount) + " questions correct."
        }
        else {
            if pct >= 0.80 {
                result = "Close! You got " + String(questionCount - wrongCount) + " out of " + String(questionCount) + " questions correct."
            }
            else {
                result = "Better luck next time! You only got " + String(questionCount - wrongCount) + " out of " + String(questionCount) + " questions correct."
            }
        }
        scoreLabel.text = result
    }
    @IBAction func mainMenu(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "mainsegue", sender: self)
    }
}
