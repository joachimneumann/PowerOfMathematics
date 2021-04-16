//
//  Model.swift
//  Fitch Cheney
//
//  Created by Joachim Neumann on 15/04/2021.
//

import Foundation

struct Model {
    enum Suit {
        case diamonds, hearts, spades, clubs
        var name: String {
            switch self {
            case .diamonds:
                return "diamonds"
            case .hearts:
                return "hearts"
            case .spades:
                return "spades"
            case .clubs:
                return "clubs"
            }
        }
        var color: String {
            switch self {
            case .diamonds:
                return "red"
            case .hearts:
                return "red"
            case .spades:
                return "black"
            case .clubs:
                return "black"
            }
        }
        var value: Int {
            switch self {
            case .diamonds:
                return 100
            case .hearts:
                return 200
            case .spades:
                return 300
            case .clubs:
                return 400
            }
        }
    }

    enum Number {
        case N2, N3, N4, N5, N6, N7, N8, N9, N10, NJ, NQ, NK, NA
        var name: String {
            switch self {
            case .N2:
                return "2"
            case .N3:
                return "3"
            case .N4:
                return "4"
            case .N5:
                return "5"
            case .N6:
                return "6"
            case .N7:
                return "7"
            case .N8:
                return "8"
            case .N9:
                return "9"
            case .N10:
                return "10"
            case .NJ:
                return "jack"
            case .NQ:
                return "queen"
            case .NK:
                return "king"
            case .NA:
                return "ace"
            }
        }
        var shortName: String {
            switch self {
            case .N2:
                return "2"
            case .N3:
                return "3"
            case .N4:
                return "4"
            case .N5:
                return "5"
            case .N6:
                return "6"
            case .N7:
                return "7"
            case .N8:
                return "8"
            case .N9:
                return "9"
            case .N10:
                return "10"
            case .NJ:
                return "J"
            case .NQ:
                return "Q"
            case .NK:
                return "K"
            case .NA:
                return "A"
            }
        }
        var value: Int {
            switch self {
            case .N2:
                return 2
            case .N3:
                return 3
            case .N4:
                return 4
            case .N5:
                return 5
            case .N6:
                return 6
            case .N7:
                return 7
            case .N8:
                return 8
            case .N9:
                return 9
            case .N10:
                return 10
            case .NJ:
                return 11
            case .NQ:
                return 12
            case .NK:
                return 13
            case .NA:
                return 14
            }
        }
    }

    func number(value: Int) -> Number {
        switch value {
            case 2:
                return .N2
            case 3:
                return .N3
            case 4:
                return .N4
            case 5:
                return .N5
            case 6:
                return .N6
            case 7:
                return .N7
            case 8:
                return .N8
            case 9:
                return .N9
            case 10:
                return .N10
            case 11:
                return .NJ
            case 12:
                return .NQ
            case 13:
                return .NK
            case 14:
                return .NA
            default:
                return .NA
        }
    }
    
    struct Card {
        var suit: Suit
        var number: Number
        
        func gt(_ c: Card) -> Bool {
            if self.value > c.value {
                return true
            }
            return false
        }
        
        func lt(_ c: Card) -> Bool {
            if self.value < c.value {
                return true
            }
            return false
        }

        var value: Int {
            suit.value + number.value
        }
        
        static func ==(lhs: Card, rhs: Card) -> Bool {
            return lhs.suit == rhs.suit && lhs.number == rhs.number
        }
    }
    
    mutating func calc() {
        var index = -100
        if cards[1].lt(cards[2]) && cards[1].lt(cards[3]) {
            // position 1: Lowest
            if cards[2].lt(cards[3]) {
                index = 1
            } else {
                index = 2
            }
        } else if cards[1].gt(cards[2]) && cards[1].gt(cards[3]) {
            // position 1: largest
            if cards[2].lt(cards[3]) {
                index = 5
            } else {
                index = 6
            }
        } else {
            // position 1: middle
            if cards[2].lt(cards[3]) {
                index = 3
            } else {
                index = 4
            }
        }

        var newIndex = cards[0].number.value + index
        if newIndex > 14 {
            newIndex = newIndex - 13
        }
        let endNumber = number(value: newIndex)
        solution = "\(endNumber.name)_of_\(cards[0].suit.name)"
    }

    
    var solution: String? = nil
    var cards: [Card] = []
        
    mutating func reset() {
        cards = []
        solution = nil
    }

    init() {
        reset()
    }

}
