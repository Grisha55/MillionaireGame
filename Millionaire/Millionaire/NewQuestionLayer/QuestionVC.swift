//
//  QuestionVC.swift
//  Millionaire
//
//  Created by Григорий Виняр on 10.08.2021.
//

import UIKit

class QuestionVC: UIViewController {

    // MARK: - Properties
    
    private let tableView = UITableView()
    private var customQuestionArray: [Question]?
    private let addButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        customQuestionArray = QuestionBuilder().build()
        
        configureTabBar()
        configureTableView()
        configureAddButton()
        
        setTableViewConstraints()
        setAddButtonConstraints()
    }
    
    // MARK: - Methods
    
    private func configureAddButton() {
        view.addSubview(addButton)
        addButton.setTitle("Добавить новый вопрос", for: .normal)
        addButton.backgroundColor = .blue
        addButton.setTitleColor(.white, for: .normal)
        addButton.addTarget(self, action: #selector(addButtonDidPressed), for: .touchUpInside)
    }
    
    @objc private func addButtonDidPressed() {
        customQuestionArray = QuestionBuilder().build()
        tableView.reloadData()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.rowHeight = 250
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(QuestionCell.self, forCellReuseIdentifier: QuestionCell.questionCell)
    }
    
    private func configureTabBar() {
        title = "New questions"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // Make constraints
    
    private func setAddButtonConstraints() {
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 30).isActive = true
        addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -80).isActive = true
    }
    
    private func setTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    

}

// MARK: - UITableViewDelegate
extension QuestionVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

// MARK: - UITableViewDataSource
extension QuestionVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customQuestionArray?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: QuestionCell.questionCell, for: indexPath) as? QuestionCell else { return UITableViewCell() }
        
        
        
//        QuestionBuilder().setQuestion(textFields[0].text ?? "Not found")
//        QuestionBuilder().setTrueAnswer(textFields[1].text ?? "Not found")
//        QuestionBuilder().setOptionsOfAnswer(textFields[2].text ?? "Not found")
//        QuestionBuilder().setOptionsOfAnswer(textFields[3].text ?? "Not found")
//        QuestionBuilder().setOptionsOfAnswer(textFields[4].text ?? "Not found")
//        QuestionBuilder().setOptionsOfAnswer(textFields[5].text ?? "Not found")
        
        return cell
    }
}
