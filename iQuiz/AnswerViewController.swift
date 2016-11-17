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
    var questions : [[String:Any]] = [[:]]
    var question : String = ""
    var model = [Subject]()
    var gameState = GameState()
    var answerChosen : Int = 0
    var rightOrWrong = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        subjectLabel.text = gameState.subject.title
        questionLabel.text = question
        correctAnswerLabel.text = answerText
        rightOrWrongLabel.text = rightOrWrong
        
        if rightOrWrong == "You got the right answer!" {
            rightOrWrongLabel.textColor = UIColor.green
            gameState.score += 1
        } else {
            rightOrWrongLabel.textColor = UIColor.red
        }
        print(gameState.questions)
        gameState.questions.remove(at: 0)
        gameState.questionsLeft = gameState.questions.count
        questions.remove(at: 0)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(gameState.questionsLeft)
        if gameState.questionsLeft > 0 {
            let questionVC = segue.destination as! QuestionViewController
            questionVC.gameState = gameState
            questionVC.questions = questions
        } else {
            let finishedVC = segue.destination as! FinishedViewController
            finishedVC.gameState = gameState
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
