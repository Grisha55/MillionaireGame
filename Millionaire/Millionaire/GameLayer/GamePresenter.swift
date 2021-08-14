//
//  GamePresenter.swift
//  Millionaire
//
//  Created by Григорий Виняр on 14.08.2021.
//

import UIKit

protocol GamePresenterProtocol {
    init(view: GameViewProtocol)
    func checkGameState()
    func checkButtonState(_ button: UIButton, numberOfQuestion: Int) -> Bool
}

class GamePresenter: GamePresenterProtocol {
    
    weak var gameView: GameViewProtocol?
    
    required init(view: GameViewProtocol) {
        self.gameView = view
    }
    
    func checkGameState() {
        if Game.shared.questionsType is ConsistentlyStrategy {
            Game.shared.questions = ConsistentlyStrategy().configureQuestions(questions: Game.shared.questions)
        } else if Game.shared.questionsType is RandomStrategy {
            Game.shared.questions = RandomStrategy().configureQuestions(questions: Game.shared.questions)
        }
    }
    
    func checkButtonState(_ button: UIButton, numberOfQuestion: Int) -> Bool {
        if button.titleLabel?.text == Game.shared.questions[numberOfQuestion].trueAnswer && numberOfQuestion < Game.shared.questions.count - 1 {
            return true
        } else {
            return false
        }
    }
    
}
