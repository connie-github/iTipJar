//
//  SettingsViewController.swift
//  iTipJar
//


import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var highStepper: UIStepper!
    @IBOutlet weak var highLabel: UILabel!
    @IBOutlet weak var midStepper: UIStepper!
    @IBOutlet weak var midLabel: UILabel!
    @IBOutlet weak var lowStepper: UIStepper!
    @IBOutlet weak var lowLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // load defaults
        let defaults = NSUserDefaults.standardUserDefaults()
        highStepper.value = defaults.doubleForKey("highDefault")
        midStepper.value = defaults.doubleForKey("midDefault")
        lowStepper.value = defaults.doubleForKey("lowDefault")
        
        highLabel.text = "\(Int(highStepper.value))%"
        midLabel.text = "\(Int(midStepper.value))%"
        lowLabel.text = "\(Int(lowStepper.value))%"
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        // save defaults
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(highStepper.value, forKey: "highDefault")
        defaults.setDouble(midStepper.value, forKey: "midDefault")
        defaults.setDouble(lowStepper.value, forKey: "lowDefault")
        defaults.synchronize()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onHighStepperChange(sender: AnyObject) {
        highLabel.text = "\(Int(highStepper.value))%"
    }
    
    @IBAction func onMidStepperChange(sender: AnyObject) {
        midLabel.text = "\(Int(midStepper.value))%"
    }
    
    @IBAction func onLowStepperChange(sender: AnyObject) {
        lowLabel.text = "\(Int(lowStepper.value))%"
    }
    
    @IBAction func onSave(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
