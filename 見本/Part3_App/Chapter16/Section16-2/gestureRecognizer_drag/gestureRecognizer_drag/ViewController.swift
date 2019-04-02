//
//  ViewController.swift
//  gestureRecognizer_drag
//
//  Created by yoshiyuki oshige on 2017/08/24.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func dragging(_ sender: UIPanGestureRecognizer) {
        // ドラッグしているビュー
        let tomobo = sender.view!
        // 指の座標に合わせる
        tomobo.center = sender.location(in: self.view)
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

