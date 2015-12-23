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
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Tipper"
        TipLabel.text = "$0.00"
        TotalLabel.text = "$0.00"
        
        let percent1 = 0.15
        let percent2 = 0.18
        let percent3 = 0.25
        defaults.setDouble(percent1, forKey: "default_tip1")
        defaults.setDouble(percent2, forKey: "default_tip2")
        defaults.setDouble(percent3, forKey: "default_tip3")
        defaults.synchronize()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let percent1 = String(format: "%.0f%%",defaults.doubleForKey("default_tip1")*100)
        let percent2 = String(format: "%.0f%%",defaults.doubleForKey("default_tip2")*100)
        let percent3 = String(format: "%.0f%%",defaults.doubleForKey("default_tip3")*100)
        
        SegmentLabel.setTitle(percent1, forSegmentAtIndex: 0)
        SegmentLabel.setTitle(percent2, forSegmentAtIndex: 1)
        SegmentLabel.setTitle(percent3, forSegmentAtIndex: 2)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func BillChanged(sender: AnyObject) {
        var TipPercentages = [defaults.doubleForKey("default_tip1"),defaults.doubleForKey("default_tip2"),defaults.doubleForKey("default_tip3")]
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

