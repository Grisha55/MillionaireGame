//
//  Game.swift
//  Millionaire
//
//  Created by Григорий Виняр on 06.08.2021.
//

import Foundation

class Game {
    
    static let shared = Game()
    
    private let recordsCaretaker = RecordsCaretaker()
    
    private(set) var records: [Record] {
        didSet {
            recordsCaretaker.save(records: self.records)
        }
    }
    
    private init() {
        self.records = recordsCaretaker.retrieveRecords()
    }
    
}
