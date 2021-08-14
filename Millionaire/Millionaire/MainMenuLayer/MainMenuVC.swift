//
//  MainMenuVC.swift
//  Millionaire
//
//  Created by Григорий Виняр on 06.08.2021.
//

import UIKit

class MainMenuVC: UIViewController {

    // MARK: - Properties
    private let mainMenuView = MainMenuView()
    private var trueAnswers = 0.0
    private var allQuestions = 10.0
    private var gameStatus: QuestionStrategy = ConsistentlyStrategy()
    
    override func loadView() {
        super.loadView()
        
        self.view = mainMenuView
        mainMenuView.mainMenuDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let procent = Int(trueAnswers) * 10
        print("Ваш результат \(procent) %")
        
        RecordsCaretaker().save(questions: Game.shared.questions)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationBar()
        mainMenuView.mainMenuDelegate = self
    }

    // MARK: - Methods
    
    private func configureNavigationBar() {
        title = "Menu"
        navigationController?.navigationBar.prefersLargeTitles = true
        let rightBarButton = UIBarButtonItem(image: UIImage(systemName: "gearshape.fill"), style: .plain, target: self, action: #selector(settingsButtonDidPressed))
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc private func settingsButtonDidPressed() {
        let settingsVC = SettingsVC()
        navigationController?.pushViewController(settingsVC, animated: true)
    }
    
}
// MARK: - GameVCDelegate
extension MainMenuVC: GameVCDelegate {
    
    func gameInformation(trueAnswers: Double, allQuestions: Double) {
        self.trueAnswers = trueAnswers
        self.allQuestions = allQuestions
    }
}

// MARK: - MainMenuDelegate
extension MainMenuVC: MainMenuDelegate {
    
    func addNewQuestionButtonDidPressed() {
        let newQuestionVC = QuestionVC()
        self.navigationController?.pushViewController(newQuestionVC, animated: true)
    }
    
    func gameButtonDidPressed() {
        let gameVC = GameVC()
        gameVC.gameVCDelegate = self
        self.navigationController?.pushViewController(gameVC, animated: true)
    }  
}
