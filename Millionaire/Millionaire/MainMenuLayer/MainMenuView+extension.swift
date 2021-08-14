//
//  MainMenuVC+extension.swift
//  Millionaire
//
//  Created by Григорий Виняр on 06.08.2021.
//

import UIKit

extension MainMenuView {
    
    func setAllConstraints(titleLabel: UILabel, stackWithButtons: UIStackView, addNewQuestionButton: UIButton) {
        self.setTitleLabelConstraints(titleLabel: titleLabel)
        self.setStackWithButtonsConstraints(stackWithButtons: stackWithButtons)
        self.setAddNewQuestionButtonConstraints(addNewQuestionButton: addNewQuestionButton, stackWithButtons: stackWithButtons)
    }
    
    private func setAddNewQuestionButtonConstraints(addNewQuestionButton: UIButton, stackWithButtons: UIStackView) {
        addNewQuestionButton.translatesAutoresizingMaskIntoConstraints = false
        addNewQuestionButton.topAnchor.constraint(equalTo: stackWithButtons.bottomAnchor, constant: 120).isActive = true
        addNewQuestionButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        addNewQuestionButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addNewQuestionButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60).isActive = true
    }
    
    private func setTitleLabelConstraints(titleLabel: UILabel) {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    private func setStackWithButtonsConstraints(stackWithButtons: UIStackView) {
        stackWithButtons.translatesAutoresizingMaskIntoConstraints = false
        stackWithButtons.heightAnchor.constraint(equalToConstant: 100).isActive = true
        stackWithButtons.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        stackWithButtons.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
}
