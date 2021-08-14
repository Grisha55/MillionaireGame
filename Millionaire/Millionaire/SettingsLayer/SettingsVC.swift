//
//  SettingsVC.swift
//  Millionaire
//
//  Created by Григорий Виняр on 10.08.2021.
//

import UIKit

protocol SettingsViewProtocol: AnyObject {
    func segmentedStateDidChange()
}

class SettingsVC: UIViewController, SettingsViewProtocol {

    // MARK: - Properties
    
    private var settingsPresenter: SettingsPresenterProtocol!
    private let typeLabel = UILabel()
    private var segmentedControl: UISegmentedControl!
    private let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        settingsPresenter = SettingsPresenter(view: self)
        configureNavigationBar()
        configureSegmentedControl()
        configureTypeLabel()
        configureStackView()
        
        setStackViewConstraints()
    }
    
    // MARK: - Methods
    
    private func configureStackView() {
        view.addSubview(stackView)
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        stackView.addArrangedSubview(typeLabel)
        stackView.addArrangedSubview(segmentedControl)
    }
    
    private func configureTypeLabel() {
        typeLabel.text = "Выберите тип вопросов:"
        
    }
    
    private func configureSegmentedControl() {
        let items = ["Последовательно", "Рандом"]
        segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.selectedSegmentTintColor = .systemOrange
        segmentedControl.tintColor = .white
        segmentedControl.addTarget(self, action: #selector(segmentedStateDidChange), for: .allEvents)
    }
    
    @objc internal func segmentedStateDidChange() {
        self.settingsPresenter.segmentedChanged(segmentedControl: segmentedControl)
    }
    
    private func configureNavigationBar() {
        title = "Settings"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // Make constraints
    
    private func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true
    }

}

