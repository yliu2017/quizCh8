//
//  ViewController.swift
//  Quiz for Chapter8
//  Finished Silver Challenge
//  Created by Yingqi Liu on 2/20/17.
//  Copyright © 2017 Yingqi Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
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
        
        animateLabelTransitions()
    }

    @IBAction func showAnswer(_ sender: UIButton){
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestionLabel.text = questions[currentQuestionIndex]
        //silver challenge
        
        // Disable current centerX constraint of nextQuestionLabel
        nextQuestionLabelCenterXConstraint.isActive = false
        
        //create a UILayoutGuide
        let space = UILayoutGuide()
        self.view.addLayoutGuide(space)
        space.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        nextQuestionLabel.centerXAnchor.constraint(equalTo: space.leadingAnchor).isActive = true
        currentQuestionLabel.centerXAnchor.constraint(equalTo: space.trailingAnchor).isActive = true
 
        //updateOffScreenLabel()
    }
    
    func updateOffScreenLabel(){
       let screenWidth = view.frame.width
       nextQuestionLabelCenterXConstraint.constant = -screenWidth
       currentQuestionLabelCenterXConstraint.constant = -screenWidth
        
       print("\(screenWidth)")
    }
    
    func animateLabelTransitions(){
     
        //Force any outstanding layout changes to occur
        view.layoutIfNeeded()
        
        //Animate the alpha
        //And the center X Constraints
        
        let screenWidth = view.frame.width
        //nextQuestionLabel.centerXAnchor.constraint(equalTo: currentQuestionLabel.centerXAnchor, constant: -screenWidth).isActive = true
        
        //self.nextQuestionLabelCenterXConstraint.constant += screenWidth
        self.currentQuestionLabelCenterXConstraint.constant += screenWidth
    
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 5,
                       options: [.curveLinear],
             
                       animations: {
                            self.currentQuestionLabel.alpha = 0
                            self.nextQuestionLabel.alpha = 1
                            self.view.layoutIfNeeded()
                        },
                       completion: { _ in
                            self.currentQuestionLabel.text = self.nextQuestionLabel.text
                            self.currentQuestionLabel.alpha = 1
                            self.currentQuestionLabelCenterXConstraint.constant = 0
                            self.view.layoutIfNeeded()
                            self.nextQuestionLabel.alpha = 0
                        })
        }
    
        
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //set the label's initial alpha
        nextQuestionLabel.alpha = 0
    }
    
}

