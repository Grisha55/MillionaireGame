//
//  GameView.swift
//  Millionaire
//
//  Created by Григорий Виняр on 14.08.2021.
//

import Foundation
import UIKit

protocol GameViewDelegate: AnyObject {
    func buttonDidTapped(button: UIButton, result: Observable<String>)
}

class GameView: UIView {
    
    private var numberOfQuestion = 0
    weak var gameViewDelegate: GameViewDelegate?
    private let stackWithButtons = UIStackView()
    private let result = Observable<String>("10")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let resultLabel = UILabel()
        let titleLabel = UILabel()
        
        self.addSubview(resultLabel)
        self.addSubview(titleLabel)
        self.addSubview(stackWithButtons)
        
        self.configureTitleLabel(titleLabel: titleLabel)
        self.configureResultLabel(resultLabel: resultLabel)
        self.configureStackWithButton(stackWithButtons: stackWithButtons)
        self.setAllConstraints(titleLabel: titleLabel, stackWithButtons: stackWithButtons, resultLabel: resultLabel)
        self.makeObserverForResult(result: result, resultLabel: resultLabel)
    }
    
    private func makeObserverForResult(result: Observable<String>, resultLabel: UILabel) {
        result.addObserver(self, options: [.new, .initial]) { result, _ in
            resultLabel.text = "Ваш результат: \(result) %"
        }
    }
    
    private func configureResultLabel(resultLabel: UILabel) {
        resultLabel.textAlignment = .center
        resultLabel.font = resultLabel.font.withSize(22)
    }
    
    private func configureTitleLabel(titleLabel: UILabel) {
        titleLabel.text = Game.shared.questions[0].question
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 30)
    }
    
    private func configureStackWithButton(stackWithButtons: UIStackView) {
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
        gameViewDelegate?.buttonDidTapped(button: button, result: self.result)
        numberOfQuestion += 1
        self.configureStackWithButton(stackWithButtons: self.stackWithButtons)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
