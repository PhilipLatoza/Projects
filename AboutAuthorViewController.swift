//
//  AboutAuthorViewController.swift
//  BullsEye
//
//  Created by Philip Latoza on 1/27/19.
//  Copyright © 2019 Philip Latoza. All rights reserved.
//

import UIKit

class AboutAuthorViewController: UIViewController {

    override func viewDidLoad() {
      super.viewDidLoad()
    }
   
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
    
}

//    Import UIKit which is apple's Software Development Kit. Contains functions that can be used for the User Interface. Created new view controller for About the Author. ViewDidLoad() loads the view and layers of buttons, labels and images when this specific view is selected. Added special function to connect with the label on the storyboard. When the button is selected, it runs an animation and closes this About the Author view and returns to the previous About the Game View.
