//
//  ViewController.swift
//  gestureRecognizer_tap
//
//  Created by yoshiyuki oshige on 2017/08/23.
//  Copyright © 2017年 yoshiyuki oshige. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Tap Gesture RecognaizerとAction接続する
    @IBAction func tapTombo(_ sender: UITapGestureRecognizer) {
        // タップされたトンボ
        let tombo = sender.view!
        // 画面のランダムな座標に移動する
        let newX = arc4random_uniform(UInt32(view.frame.width))
        let newY = arc4random_uniform(UInt32(view.frame.height))
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

