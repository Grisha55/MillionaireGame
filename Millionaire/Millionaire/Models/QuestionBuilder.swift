//
//  QuestionBuilder.swift
//  Millionaire
//
//  Created by Григорий Виняр on 11.08.2021.
//

import Foundation
import UIKit

class QuestionBuilder {
    private(set) var question: String = ""
    private(set) var optionsOfAnswer: [String] = []
    private(set) var trueAnswer: String = ""
    
    func build() -> [Question] {
        Game.shared.questions.append(Question(question: question, optionsOfAnswer: optionsOfAnswer, trueAnswer: trueAnswer))
        return Game.shared.questions
    }
    
    func setQuestion(_ question: String) {
        self.question = question
    }
    
    func setOptionsOfAnswer(_ answer: String) {
        self.optionsOfAnswer.append(answer)
    }
    
    func setTrueAnswer(_ trueAnswer: String) {
        self.trueAnswer = trueAnswer
    }
}

class QuestionEmployee {
    
    func createQuestion(questionTF: UITextField, trueTF: UITextField, firstTF: UITextField, secondTF: UITextField, thirdTF: UITextField, fourthTF: UITextField) -> [Question] {
        let builder = QuestionBuilder()
        builder.setQuestion(questionTF.text ?? "N/A")
        builder.setTrueAnswer(trueTF.text ?? "N/A")
        builder.setOptionsOfAnswer(firstTF.text ?? "N/A")
        builder.setOptionsOfAnswer(secondTF.text ?? "N/A")
        builder.setOptionsOfAnswer(thirdTF.text ?? "N/A")
        builder.setOptionsOfAnswer(fourthTF.text ?? "N/A")
        return builder.build()
    }
}
