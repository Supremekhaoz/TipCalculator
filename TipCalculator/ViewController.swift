//
//  ViewController.swift
//  TipCalculator
//
//  Created by Luis Liz on 12/20/15.
//  Copyright © 2015 Luis Liz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BillField: UITextField!
    @IBOutlet weak var TipLabel: UILabel!
    @IBOutlet weak var TotalLabel: UILabel!
    @IBOutlet weak var SegmentLabel: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        TipLabel.text = "$0.00"
        TotalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func BillChanged(sender: AnyObject) {
        var TipPercentages = [0.15,0.18,0.2]
        let TipPercentage = TipPercentages[SegmentLabel.selectedSegmentIndex]
        
        let BillAmount = NSString(string: BillField.text!).doubleValue
        let Tip = BillAmount * TipPercentage
        let Total = BillAmount + Tip
        
        TipLabel.text = String(format: "$%.2f",Tip)
        TotalLabel.text = String(format: "$%.2f", Total)
    }

    @IBAction func OnTap(sender: AnyObject) {
        view.endEditing(true)
    }

}

