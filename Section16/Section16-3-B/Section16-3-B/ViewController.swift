//
//  ViewController.swift
//  Section16-3-B
//
//  Created by Hiroki Ikeuchi on 2019/02/14.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // start touching
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#function)
        let target = touches.first?.view
        print(target!.frame)
    }
    
    // during touching
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#function)
        let loc = touches.first?.location(in: view)
        print(loc!)
    }
    
    // end touching
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#function)
    }
    
    // cancel
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print(#function)
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

