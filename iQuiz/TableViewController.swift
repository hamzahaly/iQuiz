//
//  TableViewController.swift
//  iQuiz
//
//  Created by studentuser on 11/6/16.
//
//

import UIKit

class TableViewController: UITableViewController {

    let defaults = UserDefaults.standard
    let images = [UIImage(named: "Math"), UIImage(named: "Science"), UIImage(named: "Marvel")]
    
//    let mathematics = Subject()
//    let sciences = Subject()
//    let marvel = Subject()
//    
      var model = [Subject]()
//    
//    var mathQuestions = Question()
//    var scienceQuestions = Question()
//    var marvelQuestions = Question()
//    var marvelQuestions2 = Question()
//    var marvelQuestions3 = Question()
    
    var gameState = GameState()
    var questions : [[String: Any]] = []
    
    @IBAction func settings(_ sender: UIBarButtonItem) {
        
        let settingsViewController = storyboard?.instantiateViewController(withIdentifier: "SettingsViewController")
        settingsViewController?.modalPresentationStyle = .popover
        
        let popoverViewController = settingsViewController?.popoverPresentationController
        
        popoverViewController?.barButtonItem = sender
        
        present(settingsViewController!, animated: true, completion: nil)

        
        //let settingsViewController = storyboard?.instantiateViewController(withIdentifier: "SettingsViewController")
        //settingsViewController?.modalPresentationStyle = .popover
        //present(settingsViewController!, animated: true, completion: nil)
        
        //let popoverViewController = settingsViewController!.popoverPresentationController
        //popoverViewController?.barButtonItem = sender
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config) // Load configuration into Session
        let url = URL(string: "https://tednewardsandbox.site44.com/questions.json")!
        
        defaults.set(url, forKey: "QuizURL")
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            if error != nil {
                print(error)
                self.gameState = self.defaults.object(forKey: "GameState") as! GameState
                self.model = self.defaults.object(forKey: "Model") as! Array
            } else {
                do {
                    let parsedData = try JSONSerialization.jsonObject(with: data!, options: []) as! [[String: Any]]
                    
//                    print("data: \(data!)")
//                    print("response: \(response)")
//                    print("parsedData: \(parsedData)")
                    for element in parsedData {
                        //print("element: \(element)")
                        self.model.append(Subject())
                        for model in self.model {
                            if model.title == "" {
                                model.title = element["title"] as! String
                                model.desc = element["desc"] as! String
                                model.subject = element["title"] as! String
                                self.questions = element["questions"] as! [[String: Any]]
                                model.questions = self.questions
                                //print("questions: \(model.questions)")
                            }
                        }
                        self.tableView.reloadData()
                    }
                } catch {
                    print("Serialization failed")
                }
            }
        })
        task.resume()
        //Set the subjects
//        mathematics.subject = "Mathematics"
//        sciences.subject = "Sciences"
//        marvel.subject = "Marvel Superheroes"
//        
//        //Set the titles
//        mathematics.title = "Mathematics"
//        sciences.title = "Science!"
//        marvel.title = "Marvel Super Heroes"
//        
//        //Set the descriptions
//        mathematics.desc = "Did you pass third grade?"
//        sciences.desc = "Because SCIENCE!"
//        marvel.desc = "Avengers, Assemble!"
//        
//        //Set the question classes
//        scienceQuestions.text = "What is fire?"
//        scienceQuestions.answer = "1"
//        scienceQuestions.answers = ["One of the four classical elements",
//                                    "A magical reaction given to us by God",
//                                    "A band that hasn't been discovered yet",
//                                    "Fire! Fire! Fire! heh-heh"]
//        marvelQuestions.text = "Who is Iron Man?"
//        marvelQuestions.answer = "1"
//        marvelQuestions.answers = ["Tony Stark",
//                                   "Obadiah Stane",
//                                   "A rock hit by Megadeth",
//                                   "Nobody knows"]
//        marvelQuestions2.text = "Who founded the X-men?"
//        marvelQuestions2.answer = "2"
//        marvelQuestions2.answers = ["Tony Stark",
//                                    "Professor X",
//                                    "The X-Institute",
//                                    "Erik Lensherr"]
//        marvelQuestions3.text = "How did Spider-Man get his powers?"
//        marvelQuestions3.answer = "1"
//        marvelQuestions3.answers = ["He was bit a radioactive spider",
//                                    "He ate a radioactive spider",
//                                    "He is a radioactive spider",
//                                    "He looked at a radioactive spider"]
//        mathQuestions.text = "What is 2+2?"
//        mathQuestions.answer = "1"
//        mathQuestions.answers = ["4",
//                                 "22",
//                                 "An irrational number",
//                                 "Nobody knows"]
//        
//        //Set the array of questions
//        mathematics.questions = [mathQuestions]
//        sciences.questions = [scienceQuestions]
//        marvel.questions = [marvelQuestions, marvelQuestions2, marvelQuestions3]
//        
//        model = [mathematics, sciences, marvel]
        
        defaults.set(model, forKey: "Model")
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
        
        gameState.subject = model[(indexPath?.row)!]
        gameState.questions = model[(indexPath?.row)!].questions
        gameState.currentQuestion = model[(indexPath?.row)!].questions[0]["text"]! as! String
        //print("currentQuestion: \(model[(indexPath?.row)!].questions[0]["text"])")
        
        //gameState.questions = model[(indexPath?.row)!].questions
        //gameState.currentQuestion = model[(indexPath?.row)!].questions[0]
        gameState.numberOfQuestions = model[(indexPath?.row)!].questions.count
        print(model[(indexPath?.row)!].questions.count)
        gameState.questionsLeft = model[(indexPath?.row)!].questions.count
        gameState.score = 0
        
        defaults.set(gameState, forKey: "GameState")
        
        questionVC.desc = model[(indexPath?.row)!].desc
        questionVC.subject = model[(indexPath?.row)!].subject
        questionVC.questions = model[(indexPath?.row)!].questions
        questionVC.question = model[(indexPath?.row)!].questions[0]["text"]! as! String
        questionVC.answers = model[(indexPath?.row)!].questions[0]["answers"]! as! Array
        questionVC.answer = model[(indexPath?.row)!].questions[0]["answer"]! as! String
    
        
        questionVC.gameState = gameState
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
