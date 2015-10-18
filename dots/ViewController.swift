//
//  ViewController.swift
//  dots
//
//  Created by CY on 10/18/15.
//  Copyright © 2015 CY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var skillLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var dotButton: UIButton!
    
    let iceBear1 = UIImage(named: "Ice Bear 1.png") as UIImage!
    let iceBear2 = UIImage(named: "Ice Bear 2.png") as UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        moneyLabel.text = "Tap$ \(DotData.sharedInstance.money)"
        skillLabel.text = "Cooking Skill: \(DotData.sharedInstance.skill)"
        dotButton.setImage(iceBear1, forState:.Normal)
        dotButton.setImage(iceBear2, forState:.Highlighted)
        
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        moneyLabel.text = "Tap$ \(DotData.sharedInstance.money)"
        skillLabel.text = "Cooking Skill: \(DotData.sharedInstance.skill)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func dotPressed(sender: AnyObject) {
        DotData.sharedInstance.money = DotData.sharedInstance.money + DotData.sharedInstance.skill
        moneyLabel.text = "Tap$ \(DotData.sharedInstance.money)"
    }

}

