//
//  ViewController.swift
//  Desired Weight
//
//  Created by Long Nguyen on 7/11/20.
//  Copyright © 2020 Long Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var introductionLabel: UILabel!
    
    @IBOutlet weak var cm: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var currentWeight: UILabel!
    
    @IBOutlet weak var hSlider: UISlider!
    @IBOutlet weak var aSlider: UISlider!
    @IBOutlet weak var wSlider: UISlider!

    
    @IBOutlet weak var genderView: UIView!
    @IBOutlet weak var heightView: UIView!
    @IBOutlet weak var ageView: UIView!
    @IBOutlet weak var weightView: UIView!
    
    
    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var femaleBtn: UIButton!
    
    @IBOutlet weak var button: UIButton!
    
    var gender1: String = ""
    var age1: Int = 1
    var height1: Int = 50
    var currentWeight1: Int = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UIUpdate()
        //navigationItem.hidesBackButton = true
    }
    
    
    func UIUpdate () {
        introductionLabel.text = "This app helps you to know how many calories needed each day to reach your desired weight in a certain amount of time."
        
        button.layer.cornerRadius = 24
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize (width: 4, height: 4)
        button.layer.shadowRadius = 5
        
        genderView.layer.cornerRadius = 5
        genderView.layer.shadowOpacity = 0.3
        genderView.layer.shadowOffset = CGSize (width: 2, height: 2)
        genderView.layer.shadowRadius = 5
        
        heightView.layer.cornerRadius = 5
        heightView.layer.shadowOpacity = 0.3
        heightView.layer.shadowOffset = CGSize (width: 2, height: 2)
        heightView.layer.shadowRadius = 5
        
        weightView.layer.cornerRadius = 5
        weightView.layer.shadowOpacity = 0.3
        weightView.layer.shadowOffset = CGSize (width: 2, height: 2)
        weightView.layer.shadowRadius = 5
        
        ageView.layer.cornerRadius = 5
        ageView.layer.shadowOpacity = 0.3
        ageView.layer.shadowOffset = CGSize (width: 2, height: 2)
        ageView.layer.shadowRadius = 5
        
        
        cm.text = "\(String(format: "%0.0f", hSlider.value))cm"
        age.text = "\(String(format: "%0.0f", aSlider.value)) Years old"
        currentWeight.text = "\(String(format: "%0.0f", wSlider.value)) Pounds"

    }
    
    
    
    
    
    @IBAction func maleButton(_ sender: Any) {
        maleBtn.backgroundColor = #colorLiteral(red: 0.4352941176, green: 0.8117647059, blue: 0.4117647059, alpha: 1)
        femaleBtn.backgroundColor = .clear
        gender1 = "Male"
    }
    
    @IBAction func femaleButton(_ sender: Any) {
        femaleBtn.backgroundColor = #colorLiteral(red: 0.4352941176, green: 0.8117647059, blue: 0.4117647059, alpha: 1)
        maleBtn.backgroundColor = .clear
        gender1 = "Female"
    }
    
    
    @IBAction func heightSlider(_ sender: UISlider){
        let value = String(format: "%0.0f", sender.value)
        cm.text = "\(value)cm"
        height1 = Int(value)!
    }
    
    
    @IBAction func ageSlider(_ sender: UISlider){
        let value = String(format: "%0.0f", sender.value)
        age.text = "\(value) Years old"
        age1 = Int(value)!
    }
    
    
    @IBAction func weightSlider(_ sender: UISlider){
        let value = String(format: "%0.0f", sender.value)
        currentWeight.text = "\(value) Pounds"
        currentWeight1 = Int(value)!
    }
    
    
    @IBAction func next(_ sender: Any) {
        if gender1 == "" {
            alert()
        } else {
            performSegue(withIdentifier: "segue1", sender: self)
        }
    }
    
    
    //the func below is to pass data using segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let SecondView = segue.destination as! SecondPage
        SecondView.gender2 = gender1
        SecondView.age2 = age1
        SecondView.currentWeight2 = currentWeight1
        SecondView.height2 = height1
    }
    
    
    func alert() {
        let alert = UIAlertController (title: "Please provide your gender!", message: "Your gender is very important for us to calculate your Calorie intake.", preferredStyle: .alert)
        let ok = UIAlertAction (title: "OK", style: .cancel, handler: nil)

        alert.addAction(ok)
        present (alert, animated: true, completion: nil)
    }
    
}

    
    
    
    



