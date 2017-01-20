//
//  ViewController.swift
//  Quiz
//
//  Created by Yingqi Liu on 1/20/17.
//  Copyright © 2017 Yingqi Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var questionLable: UILabel!
    @IBOutlet var answerLable: UILabel!
    
    let questions: [String] = [
        "What is 7+7?",
        "What is the capital of Vermont?",
        "What is cognac made from?"
    ]
    
    let answers: [String] = [
        "14",
        "Montpelier",
        "Grapes"
    ]
    var currentQuestionIndex: Int = 0
    

    @IBAction func showNextQuestion(_ sender: UIButton){
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        let question: String = questions[currentQuestionIndex]
        questionLable.text = question
        answerLable.text = "???"
    }

    @IBAction func showAnswer(_ sender: UIButton){
        let answer: String = answers[currentQuestionIndex]
        answerLable.text = answer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLable.text = questions[currentQuestionIndex]
    }
    
}

