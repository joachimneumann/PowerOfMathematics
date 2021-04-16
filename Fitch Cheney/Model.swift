//
//  Model.swift
//  Fitch Cheney
//
//  Created by Joachim Neumann on 15/04/2021.
//

import Foundation

struct Model {
    enum Suit {
        case none, diamonds, hearts, spades, clubs
        var name: String {
            switch self {
            case .none:
                return "none"
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
        var value: Int {
            switch self {
            case .none:
                return -10000
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
        case none, N2, N3, N4, N5, N6, N7, N8, N9, N10, NJ, NQ, NK, NA
        var name: String {
            switch self {
            case .none:
                return "none"
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
            case .none:
                return "none"
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
            case .none:
                return -10000
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
                return .none
        }
    }
    
    struct Card {
        var suit: Suit
        var number: Number
        var color: String {
            switch suit {
            case .none:
                return "black"
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
        let suit = cards[0].suit
        let startNumber = cards[0].number
//        1 = LMH 012 1<2, 1<3, 2<3
//        2 = LHM 021 1<2, 1<3, 2>3
//        3 = MLH 102 1>2, 1<3, 2<3
//        4 = MHL 120 1<2, 1>3, 2>3
//        5 = HLM 201 1>2, 1>3, 2<3
//        6 = HML 210 1>2, 1>3, 2>3
        var index = -100
        if cards[1].lt(cards[2]) {
            // 1 < 2
            if cards[1].lt(cards[3]) {
                // 1 < 3
                // Lxx
                if cards[2].lt(cards[3]) {
                    // 2 < 3
                    // LMH
                    index = 1
                } else {
                    // 2 > 3
                    // LHM
                    index = 2
                }
            } else {
                // 1 > 3
                // Mxx
                if cards[2].lt(cards[3]) {
                    // 2 < 3
                    // impossible
                } else {
                    // 2 > 3
                    // MHL
                    index = 4
                }
            }
        } else {
            // 1 > 2
            if cards[1].lt(cards[3]) {
                // 1 < 3
                // Mxx
                if cards[2].lt(cards[3]) {
                    // 2 < 3
                    // MLH
                    index = 3
                } else {
                    // 2 > 3
                    // impossible
                }
            } else {
                // 1 > 3
                // Hxx
                if cards[2].lt(cards[3]) {
                    // 2 < 3
                    // HLM
                    index = 5
                } else {
                    // 2 > 3
                    // HML
                    index = 6
                }
            }
        }
        var newIndex = startNumber.value + index
        if newIndex > 14 {
            newIndex = newIndex - 13
        }
        let endNumber = number(value: newIndex)
        
        solution = "\(endNumber.name)_of_\(suit.name)"
    }
    
    var solution: String? = nil
    var cards: [Card] = []
    var current: Int?
        
    var currentCard: Model.Card {
        cards[current!]
    }

    mutating func reset() {
        cards = [Card(suit: .none, number: .none), Card(suit: .none, number: .none), Card(suit: .none, number: .none), Card(suit: .none, number: .none)]
        current = 0
        solution = nil
    }

    init() {
        reset()
    }

}
