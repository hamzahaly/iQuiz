//
//  QuestionModel.swift
//  iQuiz
//
//  Created by studentuser on 11/10/16.
//
//

import Foundation

open class Question : NSDictionary {
    var text: String = ""
    var answer: String = ""
    var answers: [String] = []
}
