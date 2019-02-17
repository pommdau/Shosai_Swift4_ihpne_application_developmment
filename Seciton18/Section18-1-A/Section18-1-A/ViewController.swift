//
//  ViewController.swift
//  Section18-1-A
//
//  Created by Hiroki Ikeuchi on 2019/02/17.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mySwitch1: UISwitch!
    @IBOutlet weak var mySwitch2: UISwitch!
    
    @IBAction func saveStatus(_ sender: Any) {
        // refer UserDefault
        let defaults = UserDefaults.standard
        defaults.set(mySwitch1.isOn, forKey: "Swithon")
    }
    
    @IBAction func readStatus(_ sender: Any) {
        // refer UserDefault
        let defaults = UserDefaults.standard
        mySwitch2.isOn = defaults.bool(forKey: "switchOn")
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

