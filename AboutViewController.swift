//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Philip Latoza on 1/27/19.
//  Copyright © 2019 Philip Latoza. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
      super.viewDidLoad()
        
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            let url = URL(fileURLWithPath: htmlPath)
            let request = URLRequest(url: url)
            webView.load(request)
        }
        
    }

    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
    
}

//   Import UIKit which is apple's Software Development Kit. Contains functions that can be used for the User Interface. Created new view controller for About the Game. ViewDidLoad() loads the view and layers of buttons, labels and images when this specific view is selected. Added htmlPath which adds a webView with game instructions written in HTML.


//    Added special function to connect with the label on the storyboard. When the button is selected, it runs an animation and closes this About view and returns to the previous About the Main View where you are able to play the game.
