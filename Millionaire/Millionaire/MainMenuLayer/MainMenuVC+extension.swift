//
//  MainMenuVC+extension.swift
//  Millionaire
//
//  Created by Григорий Виняр on 06.08.2021.
//

import UIKit

extension MainMenuVC {
    
    func setAllConstraints(titleLabel: UILabel, stackWithButtons: UIStackView) {
        self.setTitleLabelConstraints(titleLabel: titleLabel)
        self.setStackWithButtonsConstraints(stackWithButtons: stackWithButtons)
    }
    
    private func setTitleLabelConstraints(titleLabel: UILabel) {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    private func setStackWithButtonsConstraints(stackWithButtons: UIStackView) {
        stackWithButtons.translatesAutoresizingMaskIntoConstraints = false
        stackWithButtons.heightAnchor.constraint(equalToConstant: 100).isActive = true
        stackWithButtons.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackWithButtons.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackWithButtons.widthAnchor.constraint(equalToConstant: view.frame.width - 100).isActive = true
    }
}
