//
//  QuizModel.swift
//  iQuiz
//
//  Created by studentuser on 11/9/16.
//
//

import Foundation

open class Subject {
    fileprivate var subject: String
    fileprivate var questions : [String : Int]
    //var question : String
    var answers :  [Int: String]
    
    public init(subject: String, questions: [String : Int], answers: [Int: String]) {
        self.subject = subject
        self.questions = questions
        self.answers = answers
    }
    
    public func isCorrect() -> Bool {
        
        return true
    }
}
