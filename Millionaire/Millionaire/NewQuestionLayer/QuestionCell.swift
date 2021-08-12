//
//  QuestionCell.swift
//  Millionaire
//
//  Created by Григорий Виняр on 11.08.2021.
//

import UIKit

class QuestionCell: UITableViewCell {

    // MARK: - Properties
    
    static let questionCell = "QuestionCell"
    private let questionTF = UITextField()
    private let trueTF = UITextField()
    private let firstTF = UITextField()
    private let secondTF = UITextField()
    private let thirdTF = UITextField()
    private let fourthTF = UITextField()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.isUserInteractionEnabled = true
        configureTFs()
        setTFsConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func configureTFs() {
        self.addSubview(questionTF)
        self.addSubview(trueTF)
        self.addSubview(firstTF)
        self.addSubview(secondTF)
        self.addSubview(thirdTF)
        self.addSubview(fourthTF)
        
        questionTF.placeholder = "Вопрос"
        trueTF.placeholder = "Правильный ответ"
        firstTF.placeholder = "Первый ответ"
        secondTF.placeholder = "Второй ответ"
        thirdTF.placeholder = "Третий ответ"
        fourthTF.placeholder = "Четвертый ответ"
        
    }
    
    private func setTFsConstraints() {
        questionTF.translatesAutoresizingMaskIntoConstraints = false
        trueTF.translatesAutoresizingMaskIntoConstraints = false
        firstTF.translatesAutoresizingMaskIntoConstraints = false
        secondTF.translatesAutoresizingMaskIntoConstraints = false
        thirdTF.translatesAutoresizingMaskIntoConstraints = false
        fourthTF.translatesAutoresizingMaskIntoConstraints = false
        
        questionTF.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        questionTF.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        questionTF.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        questionTF.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        trueTF.topAnchor.constraint(equalTo: questionTF.bottomAnchor, constant: 10).isActive = true
        trueTF.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        trueTF.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        trueTF.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        firstTF.topAnchor.constraint(equalTo: trueTF.bottomAnchor, constant: 10).isActive = true
        firstTF.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        firstTF.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        firstTF.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        secondTF.topAnchor.constraint(equalTo: firstTF.bottomAnchor, constant: 10).isActive = true
        secondTF.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        secondTF.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        secondTF.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        thirdTF.topAnchor.constraint(equalTo: secondTF.bottomAnchor, constant: 10).isActive = true
        thirdTF.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        thirdTF.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        thirdTF.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        fourthTF.topAnchor.constraint(equalTo: thirdTF.bottomAnchor, constant: 10).isActive = true
        fourthTF.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        fourthTF.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        fourthTF.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    

    
}
