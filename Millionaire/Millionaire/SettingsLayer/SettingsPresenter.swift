//
//  SettingsPresenter.swift
//  Millionaire
//
//  Created by Григорий Виняр on 14.08.2021.
//

import UIKit

protocol SettingsPresenterProtocol {
    init(view: SettingsViewProtocol)
    func segmentedChanged(segmentedControl: UISegmentedControl)
}

class SettingsPresenter: SettingsPresenterProtocol {
    
    weak var settingsView: SettingsViewProtocol?
    
    required init(view: SettingsViewProtocol) {
        self.settingsView = view
    }
    
    
    func segmentedChanged(segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            Game.shared.questionsType = ConsistentlyStrategy()
        case 1:
            Game.shared.questionsType = RandomStrategy()
        default:
            Game.shared.questionsType = ConsistentlyStrategy()
        }
    }
}
