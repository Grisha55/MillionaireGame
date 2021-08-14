//
//  GameVC.swift
//  Millionaire
//
//  Created by Григорий Виняр on 06.08.2021.
//

import UIKit

protocol GameVCDelegate: AnyObject {
    func gameInformation(trueAnswers: Double, allQuestions: Double)
}

protocol GameViewProtocol: AnyObject {
    func checkGameState()
}

class GameVC: UIViewController, GameViewProtocol {

    // MARK: - Properties
    private var numberOfQuestion = 0
    private var gamePresenter: GamePresenterProtocol!
    weak var gameVCDelegate: GameVCDelegate?
    private let gameView = GameView()
    
    override func loadView() {
        super.loadView()
        
        self.view = gameView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        gamePresenter = GamePresenter(view: self)
        gameView.gameViewDelegate = self
        checkGameState()
    }
    
    // MARK: - Methods
    
    internal func checkGameState() {
        gamePresenter.checkGameState()
    }
}

// MARK: - GameViewDelegate
extension GameVC: GameViewDelegate {
    
    func buttonDidTapped(button: UIButton, result: Observable<String>) {
        if self.gamePresenter.checkButtonState(button, numberOfQuestion: numberOfQuestion) {
            result.value = "\(self.numberOfQuestion * 10)"
            self.numberOfQuestion += 1
        } else {
            gameVCDelegate?.gameInformation(trueAnswers: Double(numberOfQuestion), allQuestions: Double(Game.shared.questions.count))
            navigationController?.popViewController(animated: true)
        }
    }
    
}
