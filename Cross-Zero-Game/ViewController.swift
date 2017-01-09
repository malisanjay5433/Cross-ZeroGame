//
//  ViewController.swift
//  Cross-Zero-Game
//
//  Created by Sanjay Mali on 09/01/17.
//  Copyright © 2017 Sanjay. All rights reserved.
//

import UIKit
import Spring
class ViewController: UIViewController {

    var activePlayer = 1 //cross
    var state = [0,0,0,0,0,0,0,0,0]
    var gameisActive = true
    var Winning_Combination = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

    @IBOutlet weak var player_Status: UILabel!
    @IBOutlet weak var play_Again: SpringButton!
    
    @IBAction func didPress(_ sender: AnyObject) {
        if (state[sender.tag - 1] == 0){
            state[sender.tag - 1] = activePlayer
        if activePlayer == 1{
            sender.setImage(UIImage(named:"Cross"), for: .normal)
            activePlayer = 2
        }else{
            sender.setImage(UIImage(named:"Nought"), for: .normal)
            activePlayer = 1
            }
    }
        
        for comination in Winning_Combination{
            if  state[comination[0]] != 0 && state[comination[0]] == state[comination[1]] &&
                state[comination[1]] == state[comination[2]] {
                gameisActive = false
                if state[comination[0]] == 1{
                    //Cross has won
                    player_Status.text = "Cross has Won"
                    
                } else{
                    //Nought has won
                    player_Status.text = "Nought has Won"

                }
                player_Status.isHidden = false
                play_Again.isHidden = false
            }
            
        }
        

    }
    
    @IBAction func playAgain(_ sender: AnyObject) {
        activePlayer = 1 //cross
        state = [0,0,0,0,0,0,0,0,0]
        gameisActive = true
        player_Status.isHidden = true
        play_Again.isHidden = true
        for i in 1...9 {
            let b = view.viewWithTag(i) as! UIButton
            b.setImage(nil, for: .normal)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

