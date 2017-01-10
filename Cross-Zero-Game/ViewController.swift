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
    @IBOutlet weak var play_Again: UIButton!
    
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
                if state[comination[0]] == 1 {
                    //Cross has won
                    player_Status.text = "Cross has Won"
                    
                } else if state[comination[0]] == 2 {
                    //Nought has won
                    player_Status.text = "Nought has Won"

                }else if state[comination[0]] == 3 {
                    player_Status.text = "Draw Try one more time"
                    player_Status.isHidden = false
                    play_Again.isHidden = false
                }
                player_Status.isHidden = false
                play_Again.isHidden = false
            }
            
//            if Winning_Combination.count == 7{
//                player_Status.isHidden = false
//                play_Again.isHidden = false
//                player_Status.text = "Try one more time"
//
//            }
        }
        
    }
    
    @IBAction func playAgain(_ sender: AnyObject) {
        activePlayer = 1 //cross
        state = [0,0,0,0,0,0,0,0,0]
        gameisActive = true
        player_Status.isHidden = true
//        play_Again.isHidden = true
        for i in 1...9 {
            let b = view.viewWithTag(i) as! UIButton
            b.setImage(nil, for: .normal)
        }
        
    }
    
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        player_Status.isHidden = true
        
        player_Status.layer.cornerRadius = 5
        player_Status.layer.borderWidth  = 3
        player_Status.layer.borderColor = UIColor.lightGray.cgColor
        player_Status.layer.shadowColor = UIColor.gray.cgColor
        player_Status.layer.shadowOpacity = 1
        player_Status.layer.shadowOffset = CGSize.zero
        player_Status.layer.shadowRadius = 10
        player_Status.layer.shadowPath = UIBezierPath(rect: player_Status.bounds).cgPath
        

        play_Again.layer.cornerRadius = 5
        play_Again.layer.borderWidth  = 3
        play_Again.layer.borderColor = UIColor.lightGray.cgColor
        play_Again.layer.shadowColor = UIColor.gray.cgColor
        play_Again.layer.shadowOpacity = 1
        play_Again.layer.shadowOffset = CGSize.zero
        play_Again.layer.shadowRadius = 10
        play_Again.layer.shadowPath = UIBezierPath(rect: play_Again.bounds).cgPath
        
    }
}

