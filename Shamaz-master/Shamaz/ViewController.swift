//
//  ViewController.swift
//  test
//
//  Created by ollie on 13/03/2019.
//  Copyright © 2019 Oliver McConnie. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Labels: UILabel!
    
    let textpast = ["Where were you last sunday morning?",
                    "What was the last film you watched?",
                    "Have you travelled to another city in the past two weeks?",
                    "Have you had any strange dreams lately?",
                    "What was the last youtube video you watched?",
                    "What was the last thing you bourgh online?",
                    "What was the most exciting thing you did last week?",
                    "What did you have for breakfast this morning?",
                    "Have you been leasoning to any music in paticular lately?"]
    
    let textfuture = [ "Any hopes for the week ahead?",
                       "Will you visit another city or town next week, if so where?",
                       "When is your next Holiday?",
                       "What are you looking forward too in the coming weeks?",
                       "Any plan to eat out anywhere?",
                       "what will you be doing this coming weekend?"]
    
    @IBAction func past() {
        Labels.text = textpast[Int.random(in: 0...textpast.count - 1)]
    }
    
    @IBAction func future() {
        Labels.text = textfuture[Int.random(in: 0...textfuture.count - 1)]
    
    }
    
    @IBAction func nextplayer() {
        Labels.text = String(Int.random(in: 1...10))
    }
    
    @IBAction func inst() {
        Labels.text = "Shamaz is a party game, players can choose 'The future' or 'The Past' to prompt a question to share with the group. The next player button can be used to  generating a number from 1 to 10. In this case, the players should form a circle and starting from the active player, count off to identify the nominated person."
    }
}
