//
//  ViewController.swift
//  tictactoe
//
//  Created by PATRICK MARSHALL on 7/4/17.
//  Copyright © 2017 patrickmarshall. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var activePlayer = 1 //cross
    var gameState = [0,0,0,0,0,0,0,0,0]
    let winningCombination = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    var gameIsActive = true
    
    @IBAction func action(_ sender: AnyObject) {
        if (gameState[sender.tag-1] == 0 && gameIsActive == true){
            gameState[sender.tag-1] = activePlayer
            if activePlayer == 1{
                sender.setImage(UIImage(named: "x.png"), for: UIControlState())
                activePlayer = 2
            }
            else{
                sender.setImage(UIImage(named: "o.png"), for: UIControlState())
                activePlayer = 1
            }
        }
        for combination in winningCombination{
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]{
                gameIsActive = false
                if gameState[combination[0]] == 1{
                    //cross win
                    congrats.text = "CROSS IS WIN"
                }
                else {
                    //circle win
                    congrats.text = "CIRCLE IS WIN"
                }
                playAgainButton.isHidden = false
                congrats.isHidden = false
            }
        }
        gameIsActive = false
        
        for i in gameState{
            if i == 0{
                gameIsActive = true
                break
            }
        }
        if gameIsActive == false{
            congrats.text = "DRAW"
            congrats.isHidden = false
            playAgainButton.isHidden = false
            
            
        }
    }
    
    @IBOutlet weak var congrats: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBAction func playAgain(_ sender: Any) {
        gameState = [0,0,0,0,0,0,0,0,0]
        gameIsActive = true
        activePlayer = 1
        
        playAgainButton.isHidden = true
        congrats.isHidden = true
        
        for i in 1...9{
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
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

