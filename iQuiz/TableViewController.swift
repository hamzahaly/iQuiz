//
//  TableViewController.swift
//  iQuiz
//
//  Created by studentuser on 11/6/16.
//
//

import UIKit

class TableViewController: UITableViewController {

    
    let images = [UIImage(named: "Math"), UIImage(named: "Science"), UIImage(named: "Marvel")]
    
    let mathematics = Subject()
    let sciences = Subject()
    let marvel = Subject()
    
    var model = [Subject]()
    
    var mathQuestions = Question()
    var scienceQuestions = Question()
    var marvelQuestions = Question()
    var marvelQuestions2 = Question()
    var marvelQuestions3 = Question()
    
    @IBAction func settingsBtn(_ sender: Any) {
        let alert = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set the subjects
        mathematics.subject = "Mathematics"
        sciences.subject = "Sciences"
        marvel.subject = "Marvel Superheroes"
        
        //Set the titles
        mathematics.title = "Mathematics"
        sciences.title = "Science!"
        marvel.title = "Marvel Super Heroes"
        
        //Set the descriptions
        mathematics.desc = "Did you pass third grade?"
        sciences.desc = "Because SCIENCE!"
        marvel.desc = "Avengers, Assemble!"
        
        //Set the question classes
        scienceQuestions.text = "What is fire?"
        scienceQuestions.answer = "1"
        scienceQuestions.answers = ["One of the four classical elements",
                                    "A magical reaction given to us by God",
                                    "A band that hasn't been discovered yet",
                                    "Fire! Fire! Fire! heh-heh"]
        marvelQuestions.text = "Who is Iron Man?"
        marvelQuestions.answer = "1"
        marvelQuestions.answers = ["Tony Stark",
                                   "Obadiah Stane",
                                   "A rock hit by Megadeth",
                                   "Nobody knows"]
        marvelQuestions2.text = "Who founded the X-men?"
        marvelQuestions2.answer = "2"
        marvelQuestions2.answers = ["Tony Stark",
                                    "Professor X",
                                    "The X-Institute",
                                    "Erik Lensherr"]
        marvelQuestions3.text = "How did Spider-Man get his powers?"
        marvelQuestions3.answer = "1"
        marvelQuestions3.answers = ["He was bit a radioactive spider",
                                    "He ate a radioactive spider",
                                    "He is a radioactive spider",
                                    "He looked at a radioactive spider"]
        mathQuestions.text = "What is 2+2?"
        mathQuestions.answer = "1"
        mathQuestions.answers = ["4",
                                 "22",
                                 "An irrational number",
                                 "Nobody knows"]
        
        //Set the array of questions
        mathematics.questions = [mathQuestions]
        sciences.questions = [scienceQuestions]
        marvel.questions = [marvelQuestions, marvelQuestions2, marvelQuestions3]
        
        model = [mathematics, sciences, marvel]
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    */
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "iQuizCell", for: indexPath) as! iQuizTableViewCell
        
        // Configure the cell...
        
        cell.questionLabel.text = model[indexPath.row].subject
        cell.imageLabel.image = images[indexPath.row]
        cell.descLabel.text = model[indexPath.row].desc

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "QuestionSegue", sender: model)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let questionVC = segue.destination as! QuestionViewController
        let indexPath = self.tableView.indexPathForSelectedRow
        questionVC.desc = model[(indexPath?.row)!].desc
        questionVC.subject = model[(indexPath?.row)!].subject
        questionVC.questions = model[(indexPath?.row)!].questions
        questionVC.question = model[(indexPath?.row)!].questions[0]
        questionVC.answers = model[(indexPath?.row)!].questions[0].answers
        
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
