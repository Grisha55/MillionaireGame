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
    
    var questions = [
        Question(question: "Какую фамилию носил главный герой поэмы А.Твардовского?", optionsOfAnswer: ["Болотников", "Теркин", "Воронов", "Иванов"], trueAnswer: "Теркин"),
        Question(question: "В песне какого барда есть строчка Лыжи у печки стоят... ?", optionsOfAnswer: ["Юрий Визбор", "Булат Окуджава", "Максим Галкин", "Монатик"], trueAnswer: "Юрий Визбор"),
        Question(question: "Какой советский космонавт получил первую космическую почту?", optionsOfAnswer: ["Юрий Гагарин", "Иван Семенов", "Сергей Скворцов", "Владимир Шаталов"], trueAnswer: "Владимир Шаталов"),
        Question(question: "Как называют звезду, которая указала волхвам место рождения Христа?", optionsOfAnswer: ["Полярная", "Вифлеемская", "Солнце", "Аравийская"], trueAnswer: "Вифлеемская"),
        Question(question: "Где, если верить пословице, любопытной Варваре нос оторвали?", optionsOfAnswer: ["На базаре", "На пире", "На реке", "В гостях"], trueAnswer: "На базаре"),
        Question(question: "Кто автор проекта радиобашни на Шаболовке?", optionsOfAnswer: ["Николай Ермолин", "Андрей Шахов", "Владимир Шухов", "Борис Федоров"], trueAnswer: "Владимир Шухов"),
        Question(question: "Какой знак восточного гороскопа следует за знаком Дракона?", optionsOfAnswer: ["Коза", "Рыбы", "Ворон", "Змея"], trueAnswer: "Змея"),
        Question(question: "Где проходила первая Главная ёлка Страны Советов?", optionsOfAnswer: ["В Доме союзов", "В дворце пионеров", "Нигде", "В Москве"], trueAnswer: "В Доме союзов"),
        Question(question: "Какие семьи, по мнению Л. Н. Толстого, похожи друг на друга?", optionsOfAnswer: ["Здоровые", "Здравые", "Плохие", "Счастливые"], trueAnswer: "Счастливые"),
        Question(question: "К какому семейству птиц относится снегирь?", optionsOfAnswer: ["Полевые", "Вьюрковые", "Птичьи", "Ператые"], trueAnswer: "Вьюрковые"),
    ]
    
    var questionsType: QuestionStrategy = ConsistentlyStrategy()
    
    private(set) var records: [Record] {
        didSet {
            recordsCaretaker.save(records: self.records)
        }
    }
    
    private init() {
        self.records = recordsCaretaker.retrieveRecords()
    }
    
}
