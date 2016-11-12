//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by studentuser on 11/9/16.
//
//

import UIKit

class AnswerViewController: UIViewController {
    @IBOutlet weak var subjectLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var correctAnswerLabel: UILabel!
    
    @IBOutlet weak var rightOrWrongLabel: UILabel!
    
    var answer = ""
    var answerText = ""
    var subject = ""
    var questions = [Question()]
    var question = Question()
    var model = [Subject]()
    var gameState = GameState()
    var answerChosen : Int = 0
    var rightOrWrong = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        subjectLabel.text = subject
        questionLabel.text = question.text
        correctAnswerLabel.text = "Correct Answer: \(answerText)"
        rightOrWrongLabel.text = rightOrWrong
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
