//
//  ClassViewController.swift
//  dots
//
//  Created by CY on 10/18/15.
//  Copyright © 2015 CY. All rights reserved.
//

import UIKit

class ClassViewController: UIViewController {

    @IBOutlet weak var answerInput: UITextField!
    @IBOutlet weak var questionText: UILabel!
    
    var question = String()
    var answer = String()
    var id = String()
    var solved = false
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var rightOrWrong: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        questionText.text = question
        for solvedId in DotData.sharedInstance.solvedChallenges{
            if Int(id) == solvedId{
                solved = true
            }
        }
        
        if solved{
            rightOrWrong.text = "Correct!"
            rightOrWrong.hidden = false
            submitButton.enabled = false
            answerInput.enabled = false
            answerInput.text = answer
        }else{
            rightOrWrong.hidden = true
            submitButton.enabled = true
            answerInput.enabled = true
        }
        

    }
    @IBAction func submit(sender: AnyObject) {
        var userAnswer = answerInput.text?.lowercaseString
        if(userAnswer == answer)
        {
            rightOrWrong.text = "Correct!"
            rightOrWrong.hidden = false
            DotData.sharedInstance.skill = DotData.sharedInstance.skill + 1
            DotData.sharedInstance.solvedChallenges.append(Int(id)!)
            submitButton.enabled = false
            answerInput.enabled = false
        }else{
            rightOrWrong.text = "Wrong!"
            rightOrWrong.hidden = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
