//
//  ViewController.swift
//  Section18-1-C
//
//  Created by Hiroki Ikeuchi on 2019/02/17.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func getList(_ sender: Any) {
        let defaults = UserDefaults.standard
        if let theList = defaults.array(forKey: "myList") {
            print(theList)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let list = [1, 2, 3]
        let defaults = UserDefaults.standard
        defaults.set(list, forKey: "myList")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

