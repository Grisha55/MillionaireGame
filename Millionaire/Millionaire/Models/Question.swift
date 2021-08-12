//
//  Question.swift
//  Millionaire
//
//  Created by Григорий Виняр on 06.08.2021.
//

import Foundation

struct Question: Hashable, Codable {
    let question: String
    let optionsOfAnswer: [String]
    let trueAnswer: String
}
