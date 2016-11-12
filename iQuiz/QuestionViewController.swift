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
    
    var answers = [String]()
    var answer = ""
    var subject = ""
    var questions = [Question()]
    var question = Question()
    var desc = ""
    var model = [Subject]()
    var gameState = GameState()
    var answerChosen : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerChosen = questionPicker.selectedRow(inComponent: 0)
        
        gameState.numberOfQuestions = questions.count
        gameState.questionsLeft = questions.count
        
        
        questionPicker.dataSource = self
        questionPicker.delegate = self
        
        subjectLabel.text = subject
        questionLabel.text = question.text
        
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
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let answerVC = segue.destination as! AnswerViewController
        
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
