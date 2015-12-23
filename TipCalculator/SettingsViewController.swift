//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Luis Liz on 12/22/15.
//  Copyright © 2015 Luis Liz. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var PercentField1: UITextField!
    @IBOutlet weak var PercentField2: UITextField!
    @IBOutlet weak var PercentField3: UITextField!
    @IBOutlet weak var SavedLabel: UILabel!
   
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SavedLabel.hidden = true
        // Do any additional setup after loading the view.
        PercentField1.text = String(format: "%.0f",defaults.doubleForKey("default_tip1")*100)
        PercentField2.text = String(format: "%.0f",defaults.doubleForKey("default_tip2")*100)
        PercentField3.text = String(format: "%.0f",defaults.doubleForKey("default_tip3")*100)
        
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
    @IBAction func ChangeValues(sender: AnyObject) {
        SavedLabel.hidden = true
    }
    @IBAction func OnSave(sender: AnyObject) {
        let Percent1 = NSString(string: PercentField1.text!).doubleValue
        let Percent2 = NSString(string: PercentField2.text!).doubleValue
        let Percent3 = NSString(string: PercentField3.text!).doubleValue
        
        defaults.setDouble(Percent1/100, forKey: "default_tip1")
        defaults.setDouble(Percent2/100, forKey: "default_tip2")
        defaults.setDouble(Percent3/100, forKey: "default_tip3")
        defaults.synchronize()
        
        SavedLabel.hidden = false
    }
    @IBAction func OnTap(sender: AnyObject) {
        view.endEditing(true)
    }

}
