//
//  ViewController.swift
//  uiLabel_lineBreakMode
//
//  Created by yoshiyuki oshige on 2017/08/08.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let textData = "東京オリンピック 2020"
        myLabel.lineBreakMode = .byTruncatingMiddle
        myLabel.text = textData
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

