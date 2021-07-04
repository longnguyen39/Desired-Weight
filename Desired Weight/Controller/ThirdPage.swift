//
//  ThirdPage.swift
//  Desired Weight
//
//  Created by Long Nguyen on 7/11/20.
//  Copyright © 2020 Long Nguyen. All rights reserved.
//

import UIKit

class ThirdPage: UIViewController {
    
    @IBOutlet weak var TDEE: UILabel!
    @IBOutlet weak var neededCalorieLabel: UILabel!
    @IBOutlet weak var newCalorieIntake: UILabel!
    
    @IBOutlet weak var comments: UILabel!
    @IBOutlet weak var comments2: UILabel!
    
    
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var viewBottom: UIView!
    @IBOutlet weak var viewBottom2: UIView!
    
    var tdee3: String = ""
    var dailyCalorie3: Int = -1
    var condition: String = ""
    var time: Int = -1
    var weight: Int = -1
    var newtdee: Int = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TDEE.text = "\(tdee3)"
        neededCalorieLabel.text = "\(dailyCalorie3)"
        UIUpdate()
        CommentsUpdate()
        newCalorieIntake.text = "\(newtdee)"
    }
    
    func UIUpdate() {
        button.layer.cornerRadius = 25
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize (width: 4, height: 4)
        button.layer.shadowRadius = 5
        
        viewTop.layer.cornerRadius = 5
        viewTop.layer.shadowOpacity = 0.3
        viewTop.layer.shadowOffset = CGSize (width: 2, height: 2)
        viewTop.layer.shadowRadius = 5
        
        viewBottom.layer.cornerRadius = 5
        viewBottom.layer.shadowOpacity = 0.3
        viewBottom.layer.shadowOffset = CGSize (width: 2, height: 2)
        viewBottom.layer.shadowRadius = 5
        
        viewBottom2.layer.cornerRadius = 5
        viewBottom2.layer.shadowOpacity = 0.3
        viewBottom2.layer.shadowOffset = CGSize (width: 2, height: 2)
        viewBottom2.layer.shadowRadius = 5
    }
    
    
    
    func CommentsUpdate() {
        if condition == "gain weight" {
            comments.text = "You are gaining \(weight) Pounds in the next \(time) days, so EVERYDAY, you should eat an additional meal(s) that contain(s):"
        }
        else if condition == "lose weight" {
            comments.text = "You are losing \(weight) Pounds in the next \(time) days, so EVERYDAY, you should cut the amount of your current calories intake by:"
        }
        else {
            comments.text = "You are maintaining your weight, so your additional amount of calorie is:"
        }
    }
    
    
    
    @IBAction func recalculate(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
}
