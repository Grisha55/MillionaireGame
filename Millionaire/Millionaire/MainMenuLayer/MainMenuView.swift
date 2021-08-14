//
//  MainMenuView.swift
//  Millionaire
//
//  Created by Григорий Виняр on 14.08.2021.
//

import Foundation
import UIKit

protocol MainMenuDelegate: AnyObject {
    func addNewQuestionButtonDidPressed()
    func gameButtonDidPressed()
}

class MainMenuView: UIView {
    
    var mainMenuDelegate: MainMenuDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let titleLabel = UILabel()
        let gameButton = UIButton()
        let resultsButton = UIButton()
        let stackWithButtons = UIStackView()
        let segmentedControl = UISegmentedControl()
        let addNewQuestionButton = UIButton()
        
        self.addSubview(titleLabel)
        self.addSubview(gameButton)
        self.addSubview(resultsButton)
        self.addSubview(stackWithButtons)
        self.addSubview(segmentedControl)
        self.addSubview(addNewQuestionButton)
        
        self.configureTitleLabel(titleLabel: titleLabel)
        self.configureGameButton(gameButton: gameButton)
        self.configureResultsButton(resultsButton: resultsButton)
        self.configureStackWithButtons(stackWithButtons: stackWithButtons, gameButton: gameButton, resultsButton: resultsButton)
        self.configureAddNewQuestionButton(addNewQuestionButton: addNewQuestionButton)
        
        self.setAllConstraints(titleLabel: titleLabel, stackWithButtons: stackWithButtons, addNewQuestionButton: addNewQuestionButton)
    }
    
    private func configureAddNewQuestionButton(addNewQuestionButton: UIButton) {
        addNewQuestionButton.setTitle("Добавить новый вопрос", for: .normal)
        addNewQuestionButton.setTitleColor(.white, for: .normal)
        addNewQuestionButton.backgroundColor = .blue
        addNewQuestionButton.layer.cornerRadius = 10
        addNewQuestionButton.layer.borderWidth = 2
        addNewQuestionButton.layer.borderColor = UIColor.white.cgColor
        addNewQuestionButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        addNewQuestionButton.addTarget(self, action: #selector(addNewQuestionButtonDidPressed), for: .touchUpInside)
    }
    
    @objc private func addNewQuestionButtonDidPressed() {
        self.mainMenuDelegate?.addNewQuestionButtonDidPressed()
    }
    
    private func configureStackWithButtons(stackWithButtons: UIStackView, gameButton: UIButton, resultsButton: UIButton) {
        stackWithButtons.axis = .vertical
        stackWithButtons.alignment = .center
        stackWithButtons.distribution = .fillEqually
        stackWithButtons.spacing = 20
        
        stackWithButtons.addArrangedSubview(gameButton)
        stackWithButtons.addArrangedSubview(resultsButton)
    }
    
    private func configureResultsButton(resultsButton: UIButton) {
        resultsButton.setTitle("Результаты", for: .normal)
        resultsButton.setTitleColor(.black, for: .normal)
        resultsButton.titleLabel?.font = UIFont.italicSystemFont(ofSize: 25)
    }
    
    private func configureGameButton(gameButton: UIButton) {
        gameButton.setTitle("Играть", for: .normal)
        gameButton.setTitleColor(.black, for: .normal)
        gameButton.titleLabel?.font = UIFont.italicSystemFont(ofSize: 25)
        gameButton.addTarget(self, action: #selector(gameButtonDidTapped), for: .touchUpInside)
    }
    
    @objc private func gameButtonDidTapped() {
        self.mainMenuDelegate?.gameButtonDidPressed()
    }
    
    private func configureTitleLabel(titleLabel: UILabel) {
        titleLabel.text = "Кто хочет стать миллионером?"
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
