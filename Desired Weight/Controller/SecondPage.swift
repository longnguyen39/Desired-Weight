//
//  SecondPage.swift
//  Desired Weight
//
//  Created by Long Nguyen on 7/11/20.
//  Copyright © 2020 Long Nguyen. All rights reserved.
//

import UIKit

class SecondPage: UIViewController {
    
    
    @IBOutlet weak var desiredWeight: UILabel!
    @IBOutlet weak var desiredTime: UILabel!
    
    
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var timeSlider: UISlider!
    
    
    @IBOutlet weak var normal: UIButton!
    @IBOutlet weak var lightlyActive: UIButton!
    @IBOutlet weak var active: UIButton!
    @IBOutlet weak var veryActive: UIButton!
    @IBOutlet weak var extremelyActive: UIButton!
    
    
    @IBOutlet weak var activeLevelView: UIView!
    @IBOutlet weak var desiredWeightView: UIView!
    @IBOutlet weak var desiredTimeView: UIView!
    
    @IBOutlet weak var button: UIButton!
    
    var gender2: String = ""
    var height2: Int = -1
    var age2: Int = -1
    var currentWeight2: Int = -1
    
    var activeLevel2: Double = -1
    var desiredWeight2: Int = 50
    var desiredTime2: Int = 1
    
    var bmr: Double = -1
    var tdee: Double = -1
    var tdeePresent: String = ""
    var newTDEE: Int = -1
    var weight: Int = -1
    var dailyCalorie: Int = -1
    var condition: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        button.layer.cornerRadius = 25
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize (width: 4, height: 4)
        button.layer.shadowRadius = 5
        
        activeLevelView.layer.cornerRadius = 5
        activeLevelView.layer.shadowOpacity = 0.3
        activeLevelView.layer.shadowOffset = CGSize (width: 2, height: 2)
        activeLevelView.layer.shadowRadius = 5
        
        desiredWeightView.layer.cornerRadius = 5
        desiredWeightView.layer.shadowOpacity = 0.3
        desiredWeightView.layer.shadowOffset = CGSize (width: 2, height: 2)
        desiredWeightView.layer.shadowRadius = 5
        
        desiredTimeView.layer.cornerRadius = 5
        desiredTimeView.layer.shadowOpacity = 0.3
        desiredTimeView.layer.shadowOffset = CGSize (width: 2, height: 2)
        desiredTimeView.layer.shadowRadius = 5
        
        desiredWeight.text = "\(String(format: "%0.0f", weightSlider.value)) Pounds"
        desiredTime.text = "\(String(format: "%0.0f", timeSlider.value)) days"
    }
    
    
    
    
//MARK: - INTAKE INFORMATION
    
    @IBAction func weightLostSlider(_ sender: UISlider) {
        let value = String(format: "%0.0f", sender.value)
        desiredWeight.text = "\(value) Pounds"
        desiredWeight2 = Int(value)!
    }
    
    
    @IBAction func timeSlider(_ sender: UISlider) {
        let value = String(format: "%0.0f", sender.value)
        desiredTime.text = "\(value) days"
        desiredTime2 = Int(value)!
    }
    
    
    @IBAction func normal(_ sender: Any) {
        normal.backgroundColor = #colorLiteral(red: 0.4352941176, green: 0.8117647059, blue: 0.4117647059, alpha: 1)
        lightlyActive.backgroundColor = .clear
        active.backgroundColor = .clear
        veryActive.backgroundColor = .clear
        extremelyActive.backgroundColor = .clear
        
        activeLevel2 = 1.2
    }
    
    
    @IBAction func lightlyActive(_ sender: Any) {
        normal.backgroundColor = .clear
        lightlyActive.backgroundColor = #colorLiteral(red: 0.4352941176, green: 0.8117647059, blue: 0.4117647059, alpha: 1)
        active.backgroundColor = .clear
        veryActive.backgroundColor = .clear
        extremelyActive.backgroundColor = .clear
        
        activeLevel2 = 1.375
    }
    
    
    @IBAction func active(_ sender: Any) {
        normal.backgroundColor = .clear
        lightlyActive.backgroundColor = .clear
        active.backgroundColor = #colorLiteral(red: 0.4352941176, green: 0.8117647059, blue: 0.4117647059, alpha: 1)
        veryActive.backgroundColor = .clear
        extremelyActive.backgroundColor = .clear
        
        activeLevel2 = 1.55
    }
    
    
    @IBAction func veryActive(_ sender: Any) {
        normal.backgroundColor = .clear
        lightlyActive.backgroundColor = .clear
        active.backgroundColor = .clear
        veryActive.backgroundColor = #colorLiteral(red: 0.4352941176, green: 0.8117647059, blue: 0.4117647059, alpha: 1)
        extremelyActive.backgroundColor = .clear
        
        activeLevel2 = 1.725
    }
    
    
    @IBAction func extremelyActive(_ sender: Any) {
        normal.backgroundColor = .clear
        lightlyActive.backgroundColor = .clear
        active.backgroundColor = .clear
        veryActive.backgroundColor = .clear
        extremelyActive.backgroundColor = #colorLiteral(red: 0.4352941176, green: 0.8117647059, blue: 0.4117647059, alpha: 1)
        
        activeLevel2 = 1.9
    }
    
    
    
//MARK: - PRESENTING
    
    @IBAction func calculate(_ sender: Any) {
        print("gender: \(gender2)")
        print("height: \(height2)")
        print("age: \(age2)")
        print("currentWeight: \(currentWeight2)")
        
        print("active level: \(activeLevel2)")
        print("desired weight: \(desiredWeight2)")
        print("desired time: \(desiredTime2)")
        print("")
        
        if activeLevel2 <= 0 {
            alert()
        } else {
        calculation()
        performSegue(withIdentifier: "segue2", sender: self)
        }
        
    }

    
    
    func calculation() {
        
        if gender2 == "male" {
            bmr = 66 + 13.7 * Double(currentWeight2) * 0.45 + 5 * Double(height2) - 6.8 * Double(age2)
        }
        else if gender2 == "female" {
            bmr = 655 + 9.6 * Double(currentWeight2) * 0.45 + 1.8 * Double(height2) - 4.7 * Double(age2)
        }

        tdee = bmr * activeLevel2
        tdeePresent = String(format: "%0.0f", tdee)
        weight = currentWeight2 - desiredWeight2
        
        if weight < 0 {
            condition = "gain weight"
            print(condition)
            weight = weight * -1
            dailyCalorie = weight * 3500 / desiredTime2
            newTDEE = Int(tdee) + dailyCalorie
        }
        else if weight > 0 {
            condition = "lose weight"
            print(condition)
            dailyCalorie = weight * 3500 / desiredTime2
            newTDEE = Int(tdee) - dailyCalorie
        }
        else {
            print("maintain weight")
            dailyCalorie = 0
            newTDEE = Int(tdee)
        }
        
        
        print ("tdee: \(tdeePresent)")
        print("dailyCalorie: \(dailyCalorie)")
        print("")
    }
    
    
    
    
    //this func below is to pass data to other VC through segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let thirdView = segue.destination as! ThirdPage
        
        thirdView.tdee3 = tdeePresent
        thirdView.dailyCalorie3 = dailyCalorie
        thirdView.condition = condition
        thirdView.weight = weight
        thirdView.time = desiredTime2
        thirdView.newtdee = newTDEE
    }
    
    
    func alert() {
        let alert = UIAlertController (title: "Please provide your active level!", message: "Your active level is very important for us to calculate your Calorie intake.", preferredStyle: .alert)
        let cancel = UIAlertAction (title: "OK", style: .cancel, handler: nil)

        alert.addAction(cancel)
        present (alert, animated: true, completion: nil)
    }
    
}
