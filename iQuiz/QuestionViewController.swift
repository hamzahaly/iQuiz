//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by studentuser on 11/9/16.
//
//

import UIKit

class QuestionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var questionPicker: UIPickerView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var subjectLabel: UILabel!
    
    @IBAction func submitBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "AnswerSegue", sender: nil)
    }
    
    var gameState = GameState()
    var answers = [String]()
    var answerText = ""
    var answer = ""
    var subject = ""
    var questions = [Question()]
    var question = Question()
    var desc = ""
    var model = [Subject]()
    var answerChosen : Int = 0
    var rightOrWrong = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameState.questions = questions
        //gameState.numberOfQuestions = questions.count
        gameState.questionsLeft = questions.count
        //gameState.subject.title = subject
        
        question = gameState.questions[0]

//        answers = gameState.questions[0].answers
//        answer = gameState.questions[0].answer
//        
//        let correctAnswer = question.answer
//        if correctAnswer == "1" {
//            answerText = question.answers[0]
//        } else if correctAnswer == "2" {
//            answerText = question.answers[1]
//        } else if correctAnswer == "3" {
//            answerText = question.answers[2]
//        } else {
//            answerText = question.answers[3]
//        }
        answerChosen = questionPicker.selectedRow(inComponent: 0)
        
        questionPicker.dataSource = self
        questionPicker.delegate = self
        
        subjectLabel.text = gameState.subject.title
        //questionLabel.text = question.text
        
        getAnswer()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return answers.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return answers[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        answerChosen = pickerView.selectedRow(inComponent: 0)
        getAnswer()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let answerVC = segue.destination as! AnswerViewController
        answerVC.subject = subject
        answerVC.question = question
        answerVC.answerText = answerText
        answerVC.rightOrWrong = rightOrWrong
        answerVC.gameState = gameState
        answerVC.questions = questions
    }
    
    func getAnswer() {
        if answerChosen == 0 {
            answer = "1"
        } else if answerChosen == 1 {
            answer = "2"
        } else if answerChosen == 2 {
            answer = "3"
        } else {
            answer = "4"
        }
        
        if question.answer == answer {
            rightOrWrong = "You got the right answer!"
        } else {
            rightOrWrong = "You got the wrong answer!"
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
