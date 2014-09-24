//
//  BJPlayer.swift
//  HW01BlackJack
//
//  Created by KostaqPapa on 9/23/14.
//  Copyright (c) 2014 KostaqPapa. All rights reserved.
//

import Foundation

class BJPlayer{
    var cards: [Card] = [];
    var moneyMin: Double = 1
    var money: Double = 100;
    
    
    var betValue: Double{
        get{
            return self.moneyMin
        }
        set(newValue){
            self.moneyMin = newValue
        }
    }
    
    var maxAmount: Double{
        get{
            return self.money
        }
        set(newValue){
            self.money -= newValue
        }
    }
    
    func displayCards(){
        cards[0].hidden = false
    }
    
    func displayHand() -> String{
        var sum = ""
        for card in cards{
            if(card.hidden){
                sum += "Hidden Card \n"
            }
        }
        return sum
    }
    
    func cardHandSum() -> (intScore: Int, strScore: String){
        var sum = 0
        for card in cards{
            if(card.hidden){
                sum += 0
            }
            else{
                sum += card.rank.values.first
            }
        }
        return (sum, "\(sum)")
    }
    
    func hit(card: Card){
        cards.append(card)
    }
    
    func stand(){
        cardHandSum()
    }
}