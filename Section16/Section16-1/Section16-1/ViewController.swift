//
//  ViewController.swift
//  Section16-1
//
//  Created by Hiroki Ikeuchi on 2019/02/14.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBAction func tapTombo(_ sender: UITapGestureRecognizer) {
        let tombo = sender.view!
        let newX  = arc4random_uniform(UInt32(view.frame.width))
        let newY  = arc4random_uniform(UInt32(view.frame.height))
        tombo.center = CGPoint(x: Double(newX), y: Double(newY))
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

