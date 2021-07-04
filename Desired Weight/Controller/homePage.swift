//
//  homePage.swift
//  Desired Weight
//
//  Created by Long Nguyen on 7/16/20.
//  Copyright © 2020 Long Nguyen. All rights reserved.
//

import UIKit

class homePage: UIViewController {
    
    
    @IBOutlet weak var button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        button.layer.cornerRadius = 25
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize (width: 4, height: 4)
        button.layer.shadowRadius = 5
    }
    
    
    @IBAction func action (_ sender: Any) {
        performSegue(withIdentifier: "segue0", sender: self)
    }
    
}
