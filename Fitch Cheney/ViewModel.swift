//
//  ViewModel.swift
//  Fitch Cheney
//
//  Created by Joachim Neumann on 15/04/2021.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var model: Model
    
    func currentSuitName() -> String {
        return model.currentCard.suit.name
    }

    func currentSuit() -> Model.Suit {
        return model.currentCard.suit
    }

    var currentCounter: Int {
        model.current! + 1
    }

    var solution: String? {
        model.solution
    }

    func reset() {
        model.reset()
    }
    
    func color() -> Color {
        switch model.currentCard.color {
        case "black":
            return Color.black
        case "red":
            return Color(UIColor(red: 205/255, green: 43/255, blue: 29/255, alpha: 1))
        default:
            return Color.black
        }
    }
    
    func setSuit(_ new: Model.Suit) {
        model.cards[model.current!].suit = new
    }

    func setNumber(_ new: Model.Number) {
        model.cards[model.current!].number = new
        model.current! += 1
        if model.current! == 4 {
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
//        model.solution = "4_of_hearts"
    }
}
