//
//  RandomStrategy.swift
//  Millionaire
//
//  Created by Григорий Виняр on 10.08.2021.
//

import Foundation

class RandomStrategy: QuestionStrategy {
    
    func configureQuestions(questions: [Question]) -> [Question] {
        var randomSet = Set<Question>()
        var randomArray = [Question]()
        
        for _ in 0...100 {
            guard let randomQuestion = questions.randomElement() else { return [] }
            randomSet.insert(randomQuestion)
        }
        
        randomSet.forEach { randomArray.append($0) }
        return randomArray
    }
}
