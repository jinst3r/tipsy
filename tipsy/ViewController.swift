//
//  ViewController.swift
//  tipsy
//
//  Created by Jon Choi on 4/12/15.
//  Copyright (c) 2015 Jon Choi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipStepper: UIStepper!
    @IBOutlet weak var peopleLabel: UILabel!
    @IBOutlet weak var peopleStepper: UIStepper!
    @IBOutlet weak var perPersonCostLabel: UILabel!
    @IBOutlet weak var emojiLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        perPersonCostLabel.text = "$0.00"
        emojiLabel.text = "😘🙊💸😈😯😎❤️💳"
        
        tipStepper.wraps = true
        tipStepper.autorepeat = true
        
        println("view did load")
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = true
    }
    
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("view will appear")

        let emojis =
        [
            "💩","👹","👺","👿","😈","👎","😡","😠","😱","😨",
            "😵","😦","😕","😯","☺️","😊","😉","😚","😘","😍",
            "😎","😇","🙊","🙈","💳","💰","💴","💵","💷","💶",
            "💸",
        ]
        
        var defaults = NSUserDefaults.standardUserDefaults()
        if let loadDefaultTip: AnyObject = defaults.valueForKey("savedTipDefault") {
            println(loadDefaultTip)
            tipStepper.value = loadDefaultTip.doubleValue
            var newDefaultTipLabel = Int(tipStepper.value)
            tipPercentageLabel.text = "\(newDefaultTipLabel)"+"%"
            println(tipStepper.value)
            
            var chosenEmoji = emojis[Int(loadDefaultTip.doubleValue)-1]
            emojiLabel.text = join("", Repeat(count: Int(peopleStepper.value), repeatedValue: chosenEmoji))

        }
        if let loadDefaultPeople: AnyObject = defaults.valueForKey("savedPeopleDefault") {
            println(loadDefaultPeople)
            peopleStepper.value = loadDefaultPeople.doubleValue
            var newDefaultPeopleLabel = Int(peopleStepper.value)
            peopleLabel.text = "\(newDefaultPeopleLabel)"
            
            var chosenEmoji = emojis[Int(tipStepper.value)-1]
            emojiLabel.text = join("", Repeat(count: Int(loadDefaultPeople.doubleValue), repeatedValue: chosenEmoji))
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func stepperChange(sender: UIStepper) {
        var tipPercentageValue = Int(sender.value).description
        tipPercentageLabel.text = "\(tipPercentageValue)" + "%"
    }
    
    @IBAction func peopleStepperChange(sender: UIStepper) {
        var people = Int(sender.value).description
        peopleLabel.text = people
    }
    

    @IBAction func onEditingChanged(sender: AnyObject) {
        // var tipPercentages = [0.18, 0.2, 0.22]
        // var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]

        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tipPercentage = tipStepper.value
        var tip = billAmount * tipPercentage/100
        var total = billAmount + tip
        var people:Double = peopleStepper.value
        var perPersonCost:Double = total/people
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        perPersonCostLabel.text = String(format: "$%.2f", perPersonCost)
        
        let emojis =
            [
            "💩","👹","👺","👿","😈","👎","😡","😠","😱","😨",
            "😵","😦","😕","😯","☺️","😊","😉","😚","😘","😍",
            "😎","😇","🙊","🙈","💳","💰","💴","💵","💷","💶",
            "💸",
            ]
        
        var chosenEmoji = emojis[Int(tipPercentage)-1]
        // need to check when it goes down below 0
        
        emojiLabel.text = join("", Repeat(count: Int(people), repeatedValue: chosenEmoji))
    }
    

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }

}



















