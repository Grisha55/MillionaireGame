//
//  GameVC+extension.swift
//  Millionaire
//
//  Created by Григорий Виняр on 06.08.2021.
//

import UIKit

extension GameVC {
    
    func setAllConstraints(titleLabel: UILabel, stackWithButtons: UIStackView, resultLabel: UILabel) {
        self.setTitleLabelConstraints(titleLabel: titleLabel, resultLabel: resultLabel)
        self.setStackWithButtonsConstraints(stackWithButtons: stackWithButtons, titleLabel: titleLabel)
        self.setResultLabelConstraints(resultLabel: resultLabel)
    }
    
    private func setResultLabelConstraints(resultLabel: UILabel) {
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
    }
    
    private func setTitleLabelConstraints(titleLabel: UILabel, resultLabel: UILabel) {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 30).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    }
    
    private func setStackWithButtonsConstraints(stackWithButtons: UIStackView, titleLabel: UILabel) {
        stackWithButtons.translatesAutoresizingMaskIntoConstraints = false
        stackWithButtons.heightAnchor.constraint(equalToConstant: 200).isActive = true
        stackWithButtons.widthAnchor.constraint(equalToConstant: view.frame.width - 100).isActive = true
        stackWithButtons.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackWithButtons.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30).isActive = true
    }
}
