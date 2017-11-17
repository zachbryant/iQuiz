//
//  QuizDataSource.swift
//  iQuiz
//
//  Created by iGuest on 11/4/17.
//  Copyright © 2017 MacroHard. All rights reserved.
//

import Foundation
import UIKit

class QuizDataSource {
    static var quizzes: [Quiz] = []
    weak var tableView: UITableView?
    var vc: ViewController?
    var url: String 
    
    
    init() {
        self.url = ""
    }
    
    init(_ tableView: UITableView, _ vc: ViewController, url: String) {
        self.tableView = tableView
        self.vc = vc
        self.url = url
        fetchData()
    }
    
    func fetchData() {
        QuizDataSource.quizzes = []
        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let dataFileName = "data.json"
        if Reachability().isInternetAvailable() {
            DispatchQueue.global(qos: .userInitiated).async {
                let data = try! Data(contentsOf: URL(string: self.url)!)
                QuizDataSource.quizzes = self.parseJSON(data)
                DispatchQueue.main.async {
                    if self.tableView != nil {
                        self.vc!.data = QuizDataSource.quizzes
                        self.tableView?.reloadData()
                    }
                }
                if dir != nil {
                    let fileurl = dir?.appendingPathComponent(dataFileName)
                    do {
                        try data.write(to: fileurl!, options: Data.WritingOptions.atomic)
                    }
                    catch { NSLog(error.localizedDescription) }
                }
            }
        }
        else {
            DispatchQueue.global(qos: .userInitiated).async {
                if dir != nil {
                    let fileurl = dir?.appendingPathComponent(dataFileName)
                    var data: Data? = nil
                    do {
                        try data = Data(contentsOf: fileurl!)
                    }
                    catch { NSLog(error.localizedDescription) }
                    if data != nil && data!.count > 0 {
                        QuizDataSource.quizzes = self.parseJSON(data!)
                        DispatchQueue.main.async {
                            if self.tableView != nil {
                                self.vc!.data = QuizDataSource.quizzes
                                self.tableView?.reloadData()
                            }
                        }
                    }
                    else {
                        NSLog("Missing internet!")
                    }
                }
            }
        }
    }
    
    func parseJSON(_ inputData: Data) -> [Quiz] {
        let json = try! JSON(data: inputData)
        for i in 0..<json.count {
            QuizDataSource.quizzes.append(Quiz(json[i]))
        }
        return QuizDataSource.quizzes
    }
    
}
