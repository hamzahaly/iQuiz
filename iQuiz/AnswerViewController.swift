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
    
    @IBAction func nextButton(_ sender: UIButton) {
        if gameState.questionsLeft > 0 {
            performSegue(withIdentifier: "MoreQuestionsSegue", sender: nil)
        } else {
            performSegue(withIdentifier: "FinishedSegue", sender: nil)
        }
    }
    
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
        correctAnswerLabel.text = answerText
        rightOrWrongLabel.text = rightOrWrong
        
        if rightOrWrong == "You got the right answer!" {
            rightOrWrongLabel.textColor = UIColor.green
            gameState.score += 1
        } else {
            rightOrWrongLabel.textColor = UIColor.red
        }
        
        gameState.questions.remove(at: 0)
        gameState.questionsLeft = gameState.questions.count
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if gameState.numberOfQuestions > 0 {
            let questionVC = segue.destination as! QuestionViewController
            questionVC.gameState = gameState
        } else {
            let finishedVC = segue.destination as! FinishedViewController
        }
        
        
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
