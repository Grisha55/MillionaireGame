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

class GameVC: UIViewController {

    // MARK: - Properties
    
    private let resultLabel = UILabel()
    private var result = Observable<String>("0")
    private let titleLabel = UILabel()
    private var stackWithButtons = UIStackView()
    private var numberOfQuestion = 0
    weak var gameVCDelegate: GameVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(stackWithButtons)
        checkGameState()
        Game.shared.questions = RecordsCaretaker().retrieveRecords()
        configureStackWithButton()
        configureTitleLabel()
        configureResultLabel()
        
        result.addObserver(self, options: [.new, .initial]) { [weak self] result, _ in
            self?.resultLabel.text = "Ваш результат: \(result) %"
        }
        
        self.setAllConstraints(titleLabel: titleLabel, stackWithButtons: stackWithButtons, resultLabel: resultLabel)
    }
    
    // MARK: - Methods
    
    private func configureResultLabel() {
        view.addSubview(resultLabel)
        resultLabel.textAlignment = .center
        resultLabel.font = resultLabel.font.withSize(22)
    }
    
    private func checkGameState() {
        let consistent = ConsistentlyStrategy()
        let random = RandomStrategy()
        
        if Game.shared.questionsType is ConsistentlyStrategy {
            Game.shared.questions = consistent.configureQuestions(questions: Game.shared.questions)
            print(Game.shared.questions.count)
        } else if Game.shared.questionsType is RandomStrategy {
            Game.shared.questions = random.configureQuestions(questions: Game.shared.questions)
        } else {
            return 
        }
    }
    
    private func configureTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.text = Game.shared.questions[0].question
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 30)
    }
    
    private func configureStackWithButton() {
        stackWithButtons.subviews.forEach { subview in
            subview.isHidden = true
            stackWithButtons.removeArrangedSubview(subview)
        }
        
        stackWithButtons.axis = .vertical
        stackWithButtons.alignment = .center
        stackWithButtons.distribution = .fillEqually
        stackWithButtons.spacing = 10
        if numberOfQuestion < Game.shared.questions.count {
            
            for title in Game.shared.questions[numberOfQuestion].optionsOfAnswer {
                let button = UIButton()
                button.setTitle(title, for: .normal)
                button.setTitleColor(.black, for: .normal)
                button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
                button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
                
                stackWithButtons.addArrangedSubview(button)
            }
        }
        
    }
    
    @objc private func buttonTapped(_ button: UIButton) {
        if button.titleLabel?.text == Game.shared.questions[numberOfQuestion].trueAnswer && numberOfQuestion < Game.shared.questions.count - 1 {
            numberOfQuestion += 1
            result.value = "\(numberOfQuestion * 10)"
            titleLabel.text = Game.shared.questions[numberOfQuestion].question
            self.configureStackWithButton()
        } else {
            gameVCDelegate?.gameInformation(trueAnswers: Double(numberOfQuestion), allQuestions: Double(Game.shared.questions.count))
            navigationController?.popViewController(animated: true)
        }
        
    }
    
}
