//
//  ViewController.swift
//  timer_car
//
//  Created by Hiroki Ikeuchi on 2019/02/13.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var car: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // make a timer
        Timer.scheduledTimer(timeInterval: 0.1,
                             target      : self,
                             selector    : #selector(self.step),
                             userInfo    : nil,
                             repeats     : true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func step() {
        // move vertical
        car.center.x += 10
        // if out of right side...
        let carWidth = car.bounds.width
        if car.center.x>(view.bounds.width + carWidth/2) {
            // return left sise
            car.center.x = -carWidth
            // set random y coordinate
            let viewH = view.bounds.height  // viewH = view Height
            car.center.y = CGFloat(arc4random_uniform(UInt32(viewH)))
        }
        
    }

}

