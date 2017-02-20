//
//  ViewController.swift
//  Quiz
//
//  Created by Yingqi Liu on 1/20/17.
//  Copyright © 2017 Yingqi Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //@IBOutlet var questionLabel: UILabel!
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet var answerLabel: UILabel!
    
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
        nextQuestionLabel.text = question
        answerLabel.text = "???"
    }

    @IBAction func showAnswer(_ sender: UIButton){
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestionLabel.text = questions[currentQuestionIndex]
    }
    
    func animateLabelTransitions(){
        /*let animationClosure = {() -> Void in
        //    self.questionLabel.alpha = 1
        //}
            
        //Animate the alpha
        UIView.animate(withDuration: 0.5, animations: {
            self.currentQuestionLabel.alpha = 1
            self.nextQuestionLabel.alpha = 1
        })*/
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [],
            animations:{
                self.currentQuestionLabel.alpha = 1
                self.nextQuestionLabel.alpha = 1
        },
            completion: {_ in
                swap(&self.currentQuestionLabel,&self.nextQuestionLabel)}
        )
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //set the label's initial alpha
        nextQuestionLabel.alpha = 0
    }
    
}

