//
//  BJDeck.swift
//  HW01BlackJack
//
//  Created by KostaqPapa on 9/23/14.
//  Copyright (c) 2014 KostaqPapa. All rights reserved.
//

import Foundation

class BJDeck{
    var deckOfCards: [Card] = [];
    
    func createDeck(){
        let ranks = [Rank.Ace, Rank.Two, Rank.Three, Rank.Four, Rank.Five, Rank.Six, Rank.Seven, Rank.Eight, Rank.Nine, Rank.Nine, Rank.Ten, Rank.Jack, Rank.Queen, Rank.King]
        let suits = [Suit.Diamonds, Suit.Spades, Suit.Clubs, Suit.Hearts]
        for suit in suits{
            for rank in ranks{
                deckOfCards.append(Card(rank: rank, suit: suit))
            }
        }
    }
    func shuffleDeckOfCards(){
        for i in 0..<deckOfCards.count{
            var randomNumber = Int(arc4random_uniform(UInt32((deckOfCards.count) - i)))
            var temp = deckOfCards[i]
            deckOfCards[i] = deckOfCards[randomNumber]
            deckOfCards[randomNumber] = temp
        }
    }
}