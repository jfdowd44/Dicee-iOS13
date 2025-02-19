//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//
// Altered by John Dowd on 02/19/2025

import UIKit

class ViewController: UIViewController {

    //IBoutlets refrence UI elements
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var diceImageView3: UIImageView!
    
    // var must be outside of uibutton trigger
    var leftDice = 3
    var rightDice = 3
    
  
    @IBAction func resetButton(_ sender: UIButton) {
        
        //Additon 1, Added Reset button to reset die to 1
        diceImageView1.image = #imageLiteral(resourceName: "DiceOne")
        
        diceImageView1.alpha = 1
        
        diceImageView2.image = #imageLiteral(resourceName: "DiceOne")
        
        diceImageView2.alpha = 1
        
        diceImageView3.alpha = 0
    }
    
    
    
    @IBAction func rollBottonPressed(_ sender: UIButton) {
        
        let randomNumber1 = Int.random(in: 0...5)
        let randomNumber2 = Int.random(in: 0...5)
        let randomNumber3 = Int.random(in: 0...5)
        
        diceImageView1.alpha = 1
        diceImageView2.alpha = 2
        
        diceImageView1.image = [#imageLiteral(resourceName: "DiceOne"),#imageLiteral(resourceName: "DiceTwo"),#imageLiteral(resourceName: "DiceThree"),#imageLiteral(resourceName: "DiceFour"),#imageLiteral(resourceName: "DiceFive"),#imageLiteral(resourceName: "DiceSix")][randomNumber1]
        diceImageView2.image = [#imageLiteral(resourceName: "DiceOne"),#imageLiteral(resourceName: "DiceTwo"),#imageLiteral(resourceName: "DiceThree"),#imageLiteral(resourceName: "DiceFour"),#imageLiteral(resourceName: "DiceFive"),#imageLiteral(resourceName: "DiceSix")][randomNumber2]
        
        
        //Since 3 button changes View3.alphato 1, every roll botton hit afterward will roll all 3.
        if diceImageView3.alpha == 1 {
            
           diceImageView3.image = [#imageLiteral(resourceName: "DiceOne"),#imageLiteral(resourceName: "DiceTwo"),#imageLiteral(resourceName: "DiceThree"),#imageLiteral(resourceName: "DiceFour"),#imageLiteral(resourceName: "DiceFive"),#imageLiteral(resourceName: "DiceSix")][randomNumber3]
            
        }
        
    }
    
    
    
    @IBAction func threeDice(_ sender: UIButton) {
        
        
        diceImageView3.image = #imageLiteral(resourceName: "DiceOne")
        
        diceImageView3.alpha = 1
        
        let randomNumber1 = Int.random(in: 0...5)
        let randomNumber2 = Int.random(in: 0...5)
        let randomNumber3 = Int.random(in: 0...5)
        
        diceImageView1.image = [#imageLiteral(resourceName: "DiceOne"),#imageLiteral(resourceName: "DiceTwo"),#imageLiteral(resourceName: "DiceThree"),#imageLiteral(resourceName: "DiceFour"),#imageLiteral(resourceName: "DiceFive"),#imageLiteral(resourceName: "DiceSix")][randomNumber1]
        diceImageView2.image = [#imageLiteral(resourceName: "DiceOne"),#imageLiteral(resourceName: "DiceTwo"),#imageLiteral(resourceName: "DiceThree"),#imageLiteral(resourceName: "DiceFour"),#imageLiteral(resourceName: "DiceFive"),#imageLiteral(resourceName: "DiceSix")][randomNumber2]
        diceImageView3.image = [#imageLiteral(resourceName: "DiceOne"),#imageLiteral(resourceName: "DiceTwo"),#imageLiteral(resourceName: "DiceThree"),#imageLiteral(resourceName: "DiceFour"),#imageLiteral(resourceName: "DiceFive"),#imageLiteral(resourceName: "DiceSix")][randomNumber3]
        
    }
    
    //Addition 3. Bet button if rollsan even # win,if odd its a lose.
    @IBAction func betButton(_ sender: UIButton) {
        
        let randomNumber1 = Int.random(in: 0...5)
        let randomNumber2 = Int.random(in: 0...5)
        let finalScore = randomNumber1 + randomNumber2
        
        diceImageView1.alpha = 1
        diceImageView2.alpha = 2
        
        diceImageView1.image = [#imageLiteral(resourceName: "DiceOne"),#imageLiteral(resourceName: "DiceTwo"),#imageLiteral(resourceName: "DiceThree"),#imageLiteral(resourceName: "DiceFour"),#imageLiteral(resourceName: "DiceFive"),#imageLiteral(resourceName: "DiceSix")][randomNumber1]
        diceImageView2.image = [#imageLiteral(resourceName: "DiceOne"),#imageLiteral(resourceName: "DiceTwo"),#imageLiteral(resourceName: "DiceThree"),#imageLiteral(resourceName: "DiceFour"),#imageLiteral(resourceName: "DiceFive"),#imageLiteral(resourceName: "DiceSix")][randomNumber2]
    
        if finalScore % 2 == 0 {
            return showAlertWin( )

        }
        else {
            return showAlertLose()
        }
        func showAlertWin() {
            let alertController = UIAlertController(title: "You Win!", message: "You rolled an even number", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        }
        func showAlertLose() {
            let alertController = UIAlertController(title: "You Lose!", message: "You rolled an odd number", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        }
       
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Who   What            Value
        diceImageView1.image = #imageLiteral(resourceName: "DiceSix")
        
        diceImageView1.alpha = 0.5
        
        diceImageView2.image = #imageLiteral(resourceName: "DiceTwo")
        
        diceImageView2.alpha = 0.5
        
        //Addition* a 3rd hidden dice, hidden unless 3 dice button is hit.
        diceImageView3.image = #imageLiteral(resourceName: "DiceOne")
        
        diceImageView3.alpha = 0
        
        // Do any additional setup after loading the view.
    }

    
}

