//
//  SettingsViewController.swift
//  tipsy
//
//  Created by Jon Choi on 4/20/15.
//  Copyright (c) 2015 Jon Choi. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipDefault: UILabel!
    @IBOutlet weak var peopleDefault: UILabel!
    @IBOutlet weak var tipDefaultStepper: UIStepper!
    @IBOutlet weak var peopleDefaultStepper: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var defaults = NSUserDefaults.standardUserDefaults()
        
        if let loadDefaultTip: AnyObject = defaults.valueForKey("savedTipDefault") {
            println(loadDefaultTip)
            tipDefaultStepper.value = loadDefaultTip.doubleValue
            var newDefaultTipLabel = Int(tipDefaultStepper.value)
            tipDefault.text = "\(newDefaultTipLabel)"+"%"
            println(tipDefaultStepper.value)
        }
        if let loadDefaultPeople: AnyObject = defaults.valueForKey("savedPeopleDefault") {
            println(loadDefaultPeople)
            peopleDefaultStepper.value = loadDefaultPeople.doubleValue
            var newDefaultPeopleLabel = Int(peopleDefaultStepper.value)
            peopleDefault.text = "\(newDefaultPeopleLabel)"
            
            //peopleStepper.value = loadDefaultPeople
        }

        
        println("view did load")

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("view will appear")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tipDefaultStepperChange(sender: UIStepper) {
        var tipDefaultValue = Int(sender.value).description
        tipDefault.text = "\(tipDefaultValue)" + "%"

        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setValue(tipDefaultStepper.value, forKey: "savedTipDefault")
        defaults.synchronize()
    }

    @IBAction func peopleDefaultStepperChange(sender: UIStepper) {
        var peopleDefaultValue = Int(sender.value).description
        peopleDefault.text = "\(peopleDefaultValue)"
        
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setValue(peopleDefaultStepper.value, forKey: "savedPeopleDefault")
        defaults.synchronize()
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
