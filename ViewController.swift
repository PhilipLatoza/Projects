//
//  ViewController.swift
//  BullsEye
//
//  Created by Philip Latoza on 1/27/19.
//  Copyright © 2019 Philip Latoza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score = 0
    var round = 0
    
//    Import UIKit which is apple's Software Development Kit. Contains functions that can be used for the User Interface. Declared currentValue, targetValue, score and round as integers. Current value is the current number selected on the slider. Target value is the number the player must aim to hit on slider.
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
//    Connecting special function to storyboard editor labels. Slider, Target, Score, Round labels. Each label, button or slider on the storyboard will have code connected. It can perform certain actions such as keeping the score or round.
    
    override func viewDidLoad() {
        super.viewDidLoad()
          let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        startNewGame()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
    }
//    Method that loads the Main View, buttons and labels once the app is loaded. Declaring constants in the view such as the slider and bull's eye. When slider is moved, it shows white for normal and green when highlighted. Used images included with tutorial. Bulls Eye image is declared white when unpressed and dark when pressed. All images are declared as constants.
    
    @IBAction func showAlert() {
        
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        score += points
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            points += 50
        } else if difference < 10 {
            title = "Pretty Good!"
        } else {
            title = "Not even close..."
        }
        
//    Creating UIAlert Controller which pops up when you select a current value from the range. The pop up alert contains a title, message and action. Declared constant "difference" and point system to keep track of how many points is earned when using the slider and selecting the target number. Used If Statement for varied titles on the pop up alert if the difference between the target and current value is within a certain amount.
        
        let message = "You scored \(points) points"
       
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
//    Declared constants for the pop up alert such as the message telling you how many points you've scored after selecting a current value. Declared alert as constant to show title and message on pop up. Declared action as "Ok" in order to close the pop up. 

    
    @IBAction func sliderMoved(_ slider: UISlider) {
        let roundedValue = slider.value.rounded()
        currentValue = Int(slider.value)

    }
//    Connecting a special function with the storyboard slider. The slider initially shows as a decimal number in the terminal. This function makes sure the current value number when selected from the slider is a whole number instead of a decimal. It also makes sure it rounds correctly either up or down to the nearest whole number.
    
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabel()
    }
//    Function that makes sure the round is started at default setting. When function is used, the round adds 1 to make sure its starts at round 1 instead of 0. The target value will always be generated randomly from 1 to 100. The current value is defaulted to 50 when first starting the app.
    
    func updateLabel() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
//    Function that updates the target, score and round labels with the appropriate number. Target Value will change each round and be generated randomly. The score  will and round number will display accordingly on the view controller. Round and score will default at 0.
    
     @IBAction func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
//    Connecting special function with the storyboard button for resetting the round and score to 0. When you press the button, the game will reset the round and score to 0 so you can start a new game. This function calls upon another function startNewRound()
    
}

