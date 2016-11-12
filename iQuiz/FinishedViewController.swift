//
//  FinishedViewController.swift
//  iQuiz
//
//  Created by studentuser on 11/9/16.
//
//

import UIKit

class FinishedViewController: UIViewController {

   
    
    var gameState = GameState()
    
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func nextBtn(_ sender: Any) {
        performSegue(withIdentifier: "MainMenuSegue", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scoreLabel.text = "\(gameState.score) / \(gameState.numberOfQuestions)"
        if Double(gameState.score) / Double(gameState.numberOfQuestions) == 1 {
            descLabel.text = "Perfect!"
            descLabel.textColor = UIColor.green
        } else if Double(gameState.score) / Double(gameState.numberOfQuestions) < 0.5 {
            descLabel.text = "Better Luck Next Time"
            descLabel.textColor = UIColor.red
        } else {
            descLabel.text = "Not Bad"
        }
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
