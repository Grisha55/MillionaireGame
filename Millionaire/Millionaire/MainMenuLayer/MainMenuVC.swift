//
//  MainMenuVC.swift
//  Millionaire
//
//  Created by Григорий Виняр on 06.08.2021.
//

import UIKit

class MainMenuVC: UIViewController {

    // MARK: - Properties
    
    private let titleLabel = UILabel()
    private let gameButton = UIButton()
    private let resultsButton = UIButton()
    private let stackWithButtons = UIStackView()
    private var segmentedControl: UISegmentedControl!
    private let addNewQuestionButton = UIButton()
    private var trueAnswers = 0.0
    private var allQuestions = 10.0
    private var gameStatus: QuestionStrategy = ConsistentlyStrategy()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Поцент от общего
        
        let procent = Int(trueAnswers) * 10
        print("Ваш результат \(procent) %")
        
        RecordsCaretaker().save(questions: Game.shared.questions)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationBar()
        configureGameButton()
        configureResultsButton()
        configureStackWithButtons()
        configureTitleLabel()
        configureAddNewQuestionButton()
        
        self.setAllConstraints(titleLabel: titleLabel, stackWithButtons: stackWithButtons, addNewQuestionButton: addNewQuestionButton)
    }

    // MARK: - Methods
    
    private func configureAddNewQuestionButton() {
        view.addSubview(addNewQuestionButton)
        addNewQuestionButton.setTitle("Добавить новый вопрос", for: .normal)
        addNewQuestionButton.setTitleColor(.white, for: .normal)
        addNewQuestionButton.addTarget(self, action: #selector(addNewQuestionButtonDidPressed), for: .touchUpInside)
        addNewQuestionButton.backgroundColor = .blue
        addNewQuestionButton.layer.cornerRadius = 10
        addNewQuestionButton.layer.borderWidth = 2
        addNewQuestionButton.layer.borderColor = UIColor.white.cgColor
        addNewQuestionButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    @objc private func addNewQuestionButtonDidPressed() {
        let newQuestionVC = QuestionVC()
        navigationController?.pushViewController(newQuestionVC, animated: true)
    }
    
    private func configureStackWithButtons() {
        view.addSubview(stackWithButtons)
        stackWithButtons.axis = .vertical
        stackWithButtons.alignment = .center
        stackWithButtons.distribution = .fillEqually
        stackWithButtons.spacing = 20
        
        stackWithButtons.addArrangedSubview(gameButton)
        stackWithButtons.addArrangedSubview(resultsButton)
    }
     
    private func configureResultsButton() {
        resultsButton.setTitle("Результаты", for: .normal)
        resultsButton.setTitleColor(.black, for: .normal)
        resultsButton.titleLabel?.font = UIFont.italicSystemFont(ofSize: 25)
    }
    
    private func configureGameButton() {
        gameButton.setTitle("Играть", for: .normal)
        gameButton.setTitleColor(.black, for: .normal)
        gameButton.titleLabel?.font = UIFont.italicSystemFont(ofSize: 25)
        
        gameButton.addTarget(self, action: #selector(gameButtonDidTapped), for: .touchUpInside)
    }
    
    @objc private func gameButtonDidTapped() {
        let gameVC = GameVC()
        gameVC.gameVCDelegate = self
        self.navigationController?.pushViewController(gameVC, animated: true)
    }
    
    private func configureTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.text = "Кто хочет стать миллионером?"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
    }
    
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

extension MainMenuVC: GameVCDelegate {
    
    func gameInformation(trueAnswers: Double, allQuestions: Double) {
        self.trueAnswers = trueAnswers
        self.allQuestions = allQuestions
    }
}
