//
//  SettingsViewController.swift
//  iQuiz
//
//  Created by iGuest on 11/17/17.
//  Copyright © 2017 MacroHard. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    var url: String = ""
    
    override func viewDidLoad() {
        textField.text = self.url
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
            case "menu":
                let mvc = segue.destination as! ViewController
                if url.count > 0 {
                    mvc.url = self.url
                }
            default: NSLog("Bad segue: " + segue.identifier!)
        }
    }
    
    @IBAction func checkUrl(_ sender: UIButton) {
        self.url = textField.text!
        performSegue(withIdentifier: "menu", sender: self)
    }
    
}
