//
//  BJCard.swift
//  HW01BlackJack
//
//  Created by KostaqPapa on 9/23/14.
//  Copyright (c) 2014 KostaqPapa. All rights reserved.
//

import Foundation

enum Suit: Character{
    case Hearts = "♡", Clubs = "♣", Spades = "♠", Diamonds = "♢"
    func simpleDescription() -> String{
        switch self{
        case .Hearts: return "hearts"
        case .Clubs: return "clubs"
        case .Spades: return "spades"
        case .Diamonds: return "diamonds"
            
        }
    }
}

enum Rank: Int{
    case Jack, Queen, King, Ace
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    
    struct Values{
        let first: Int, second: Int?
    }
    
    var values: Values{
        switch self{
        case .Ace: return Values(first: 1, second: 11)
        case .Jack, .Queen, .King: return Values(first: 10, second: nil)
        default: return Values(first: self.rawValue, second: nil)
        }
    }
}

struct Card{
    var suit: Suit
    var rank: Rank
    var hidden:Bool = false
    init(rank: Rank, suit: Suit) {
        self.suit = suit
        self.rank = rank
    }
}