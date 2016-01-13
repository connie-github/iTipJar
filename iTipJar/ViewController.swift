//
//  ViewController.swift
//  iTipJar
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // focus in text field
        billField.becomeFirstResponder()
        
        // initialize labels
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        refreshTipControl()
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        // focus in text field
        billField.becomeFirstResponder()

        refreshTipControl()
        onEditingChanged(self)
    }
    
    func refreshTipControl() {
        // load defaults
        let defaults = NSUserDefaults.standardUserDefaults()
        let lowDefault = defaults.doubleForKey("lowDefault")
        let midDefault = defaults.doubleForKey("midDefault")
        let highDefault = defaults.doubleForKey("highDefault")
        
        tipControl.setTitle("\(Int(lowDefault))%", forSegmentAtIndex: 0)
        tipControl.setTitle("\(Int(midDefault))%", forSegmentAtIndex: 1)
        tipControl.setTitle("\(Int(highDefault))%", forSegmentAtIndex: 2)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        // calculate tip and total
        let tipPercentage = NSString(string: tipControl.titleForSegmentAtIndex(tipControl.selectedSegmentIndex)!).doubleValue
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage/100
        let total = billAmount + tip
        
        // format currency
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        tipLabel.text = formatter.stringFromNumber(tip)
        totalLabel.text = formatter.stringFromNumber(total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

