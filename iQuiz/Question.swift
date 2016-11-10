//
//  Question.swift
//  iQuiz
//
//  Created by studentuser on 11/9/16.
//
//

import Foundation

open class Question {
    var question : String
    var answer : String
    
    public init(question: String, answer: String) {
        self.question = question
        self.answer = answer
    }
    
    open func isCorrect() -> Bool {
        return true
    }
    
}
