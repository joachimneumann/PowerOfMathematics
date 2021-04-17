//
//  ViewModel.swift
//  Fitch Cheney
//
//  Created by Joachim Neumann on 15/04/2021.
//

import SwiftUI

class ViewModel: ObservableObject {
    private var model: Model
    @Published var selectedSuit: Model.Suit?

    func hasBeenSelected(_ c: Model.Number) -> Bool {
        let card = Model.Card(suit: selectedSuit!, number: c)
        for selected in model.cards {
            if card == selected { return true }
        }
        return false
    }
    
    var solution: String? {
        model.solution
    }

    var numberOfCards: Int {
        model.cards.count
    }
    
    @objc func reset() {
        model.reset()
    }

    var localisedCard: String {
        let language = UserDefaults.standard.string(forKey: "Language")
        switch language {
        case "English":
            return "Card"
        case "German":
            return "Karte"
        case "Vietnamese":
            return "chơi bài"
        case "Spanish":
            return "Carta"
        case "Danish":
            return "Spillekort"
        default:
            return "Card"
        }
    }
    
    func color() -> Color {
        switch selectedSuit!.color {
        case "black":
            return Color.black
        case "red":
            return Color(UIColor(red: 205/255, green: 43/255, blue: 29/255, alpha: 1))
        default:
            return Color.black
        }
    }
    
    func setSuit(_ new: Model.Suit) {
        selectedSuit = new
    }

    func setNumber(_ new: Model.Number) {
        model.cards.append(Model.Card(suit: selectedSuit!, number: new))
        selectedSuit = nil
        if model.cards.count == 4 {
            model.calc()
        }
    }

    var bottomPaddingNumbers: CGFloat {
        get {
            -15.0
        }
    }
    
    var font: Font {
        get {
            guard let customFont = UIFont(name: "American Typewriter", size: 50) else {
                return Font.system(size: 10)
            }
            return Font(customFont)
        }
    }

    init() {
        model = Model()
//        UserDefaults.standard.register(defaults: [String:Any]())
//        NotificationCenter.default.addObserver(self,selector: #selector(reset),name: UserDefaults.didChangeNotification,object: nil)

//        model.solution = "4_of_hearts"
    }
}
