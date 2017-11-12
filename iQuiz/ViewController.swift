//
//  ViewController.swift
//  iQuiz
//
//  Created by iGuest on 11/4/17.
//  Copyright © 2017 MacroHard. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!
    fileprivate var data: [Quiz] = []
    fileprivate let manager = QuizDataSource()
    var selectedIndex: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = manager.getData()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "quizsegue" {
            let qvc = segue.destination as! QuestionViewController
            qvc.quiz = self.data[selectedIndex]
            qvc.questionIndex = 0
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        NSLog("Selected row: " + String(self.selectedIndex))
        performSegue(withIdentifier: "quizsegue", sender: self)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let quiz = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! QuizCell
        cell.title.text = quiz.getSubject()!
        cell.desc.text = quiz.getDescription()!
        cell.icon.image = UIImage(named: quiz.getIcon()!)
        return cell
    }
    
    @IBAction func settingsClicked(_ sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "o shit waddup", message: "its dat settings alert!", preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { action in
            // ...
        }
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true) {
            // ...
        }
    }
    
}

