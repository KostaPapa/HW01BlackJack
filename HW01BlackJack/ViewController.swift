//
//  ViewController.swift
//  HW01BlackJack
//
//  Created by KostaqPapa on 9/23/14.
//  Copyright (c) 2014 KostaqPapa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var dealerPoints: UILabel!
    @IBOutlet var playerPoints: UILabel!
    @IBOutlet var betValue: UITextField!
    @IBOutlet var dealerCards: UITextView!
    @IBOutlet var playerCards: UITextView!
    
    var bjGame = BlackJack()
    var counter:Int = 0
        
    @IBOutlet var maxAmount: UILabel!
    
    func refresh() {
        dealerPoints.text = String(bjGame.dealer.cardHandSum().strScore)
        playerPoints.text = String(bjGame.player.cardHandSum().strScore)
        dealerCards.text = String(bjGame.dealer.displayHand())
        playerCards.text = String(bjGame.player.displayHand())
    }
    
    @IBAction func play(sender: UIButton){
        if(counter == 5){
            bjGame.deck.shuffleDeckOfCards()
        }
         else{
            counter++
        }
        bjGame.end()
        bjGame.start()
        refresh()
            
        var bidAmount = betValue.text.toInt()
        var money = maxAmount.text?.toInt()
        var temp = money! - bidAmount!
        maxAmount.text = String("$\(temp)")
    }
    
     @IBAction func hitButton(sender: UIButton){
        bjGame.hit(bjGame.player)
        bjGame.checkScore()
        refresh()
    }
    
    @IBAction func standButton(sender: UIButton){
        var foo = bjGame.stand(bjGame.player)
        bjGame.dealer.displayCards()
        refresh()
    }
        

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

