//
//  NewQuestionVC.swift
//  Millionaire
//
//  Created by Григорий Виняр on 10.08.2021.
//

import UIKit

class NewQuestionVC: UIViewController {

    // MARK: - Properties
    
    private let stackWithTF = UIStackView()
    private let addButton = UIButton()
    private var tfArray = [UITextField]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        configureNavigationBar()
        configureStackWithTF()
        configureAddButton()
        
        setStackWithTFConstraints()
        setAddButtonConstraints()
    }
    
    // MARK: - Methods
    
    private func addNewQuestionToAll() {
        
        var question = Question(question: "", optionsOfAnswer: [], trueAnswer: "")
        
        for _ in 0 ..< tfArray.count {
            
            for tf in tfArray {
                if tf.text == "" {
                    return
                }
            }
            var arrayOfAnswers = [String]()
            for i in 2 ... 5 {
                arrayOfAnswers.append(tfArray[i].text ?? "Wihout text")
            }
            question = Question(question: tfArray[0].text ?? "N/A", optionsOfAnswer: arrayOfAnswers, trueAnswer: tfArray[1].text ?? "No text")
        }
        Game.shared.questions.append(question)
    }
    
    private func configureAddButton() {
        view.addSubview(addButton)
        addButton.setTitle("Добавить", for: .normal)
        addButton.layer.cornerRadius = 15
        addButton.backgroundColor = .blue
        addButton.addTarget(self, action: #selector(addButtonDidPressed), for: .touchUpInside)
    }
    
    @objc private func addButtonDidPressed() {
        self.addNewQuestionToAll()
        navigationController?.popViewController(animated: true)
    }
    
    private func configureStackWithTF() {
        view.addSubview(stackWithTF)
        stackWithTF.axis = .vertical
        stackWithTF.alignment = .center
        stackWithTF.distribution = .fillEqually
        stackWithTF.spacing = 30
        
        let placeholders = ["Вопрос", "Правильный ответ", "Первый ответ", "Второй ответ", "Третий ответ", "Четвертый ответ"]
        
        for index in 0 ..< placeholders.count {
            let tf = UITextField()
            tf.placeholder = placeholders[index]
            tf.layer.cornerRadius = 15
            tf.layer.borderWidth = 2
            tf.layer.borderColor = UIColor.black.cgColor
            
            tf.translatesAutoresizingMaskIntoConstraints = false
            tf.heightAnchor.constraint(equalToConstant: 50).isActive = true
            tf.widthAnchor.constraint(equalToConstant: view.bounds.width - 150).isActive = true
            
            stackWithTF.addArrangedSubview(tf)
            tfArray.append(tf)
        }
    }
    
    private func configureNavigationBar() {
        title = "New question"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setAddButtonConstraints() {
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.topAnchor.constraint(equalTo: stackWithTF.bottomAnchor, constant: 30).isActive = true
        addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100).isActive = true
    }
    
    private func setStackWithTFConstraints() {
        stackWithTF.translatesAutoresizingMaskIntoConstraints = false
        stackWithTF.widthAnchor.constraint(equalToConstant: view.bounds.width - 120).isActive = true
        stackWithTF.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackWithTF.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

}
