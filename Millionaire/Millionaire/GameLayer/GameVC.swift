//
//  GameVC.swift
//  Millionaire
//
//  Created by Григорий Виняр on 06.08.2021.
//

import UIKit

protocol GameVCDelegate: AnyObject {
    func gameInformation(trueAnswers: Double, allQuestions: Double)
}

class GameVC: UIViewController {

    // MARK: - Properties
    
    private let questions = [
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
    private let titleLabel = UILabel()
    private var stackWithButtons = UIStackView()
    private var numberOfQuestion = 0
    weak var gameVCDelegate: GameVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        view.addSubview(stackWithButtons)
        
        configureStackWithButton()
        configureTitleLabel()
        
        self.setAllConstraints(titleLabel: titleLabel, stackWithButtons: stackWithButtons)
    }
    
    // MARK: - Methods
    
    private func configureTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.text = questions[0].question
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 30)
    }
    
    private func configureStackWithButton() {
        stackWithButtons.subviews.forEach { subview in
            subview.isHidden = true
            stackWithButtons.removeArrangedSubview(subview)
        }
        
        stackWithButtons.axis = .vertical
        stackWithButtons.alignment = .center
        stackWithButtons.distribution = .fillEqually
        stackWithButtons.spacing = 10
        
        for title in questions[numberOfQuestion].optionsOfAnswer {
            let button = UIButton()
            button.setTitle(title, for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            
            stackWithButtons.addArrangedSubview(button)
            
        }
        
    }
    
    @objc private func buttonTapped(_ button: UIButton) {
        if button.titleLabel?.text == questions[numberOfQuestion].trueAnswer && numberOfQuestion <= 8 {
            numberOfQuestion += 1
            titleLabel.text = questions[numberOfQuestion].question
            self.configureStackWithButton()
        } else {
            gameVCDelegate?.gameInformation(trueAnswers: Double(numberOfQuestion + 1), allQuestions: 10)
            navigationController?.popViewController(animated: true)
        }
        
    }
    
}
