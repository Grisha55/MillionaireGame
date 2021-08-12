//
//  QuestionsStrategy.swift
//  Millionaire
//
//  Created by Григорий Виняр on 10.08.2021.
//

import Foundation

protocol QuestionStrategy {
    func configureQuestions(questions: [Question]) -> [Question]
}
