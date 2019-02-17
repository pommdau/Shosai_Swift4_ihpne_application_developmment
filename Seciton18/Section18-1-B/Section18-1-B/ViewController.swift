//
//  ViewController.swift
//  Section18-1-B
//
//  Created by Hiroki Ikeuchi on 2019/02/17.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    
    @IBOutlet weak var myProgress: UIProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBAction func saveValue(_ sender: Any) {
        let defaults = UserDefaults.standard
        let value = mySlider.value
        sliderLabel.text = String(value)
        defaults.set(value, forKey: "sliderValue")
    }
    
    @IBAction func ReadValue(_ sender: Any) {
        let defaults = UserDefaults.standard
        let value = defaults.float(forKey: "sliderValue")
        progressLabel.text = String(value)
        myProgress.progress = value
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

